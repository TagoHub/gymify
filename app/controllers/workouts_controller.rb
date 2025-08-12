class WorkoutsController < ApplicationController
  before_action :set_program
  before_action :set_workout, except: [:index, :new, :create]
  before_action :empty_workout, only: [:start_workout, :preview_workout]
  before_action :authorize_workout, only: [:new, :create, :destroy, :edit, :update]

  def index
    @workouts = @program.workouts
  end

  def show
  end

  def edit
    render :form
  end

  def update
    exercise_ids = workout_params[:exercise_ids]&.reject(&:blank?)
    new_exercises = []
    if exercise_ids.present?
      ActiveRecord::Base.transaction do
        existing_names = @workout.exercise_groups.includes(:exercises).flat_map { |eg| eg.exercises.pluck(:name) }.uniq
        existing_exercises = Exercise.where(template: true, name: existing_names)
        existing_ids = existing_exercises.pluck(:id)
        new_exercise_ids = exercise_ids.map(&:to_i) - existing_ids
        ordered_new_exercises = new_exercise_ids.map { |id| Exercise.find(id) }
        starting_order = (@workout&.exercise_groups&.maximum(:order)&.to_i || 0) + 1
        ordered_new_exercises.each_with_index do |exercise, index|
          ex_group = ExerciseGroup.create!(
            workout: @workout,
            order: starting_order + index,
            superset: nil
          )
          exercise.dup.tap do |copy|
            copy.exercise_group = ex_group
            copy.template = false
            copy.save!
            if exercise.image.attached?
              copy.image.attach(exercise.image.blob)
            end
          end
        end
      end
      redirect_to program_workout_path(@program, @workout), notice: "Added #{new_exercises.size} new exercise(s) to workout."
    elsif @workout.update(workout_params)
      redirect_to program_workout_path(@program, @workout), notice: "Workout updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def new
    @workout = @program.workouts.new
    render :form
  end

  def create
    @workout = @program.workouts.new(workout_params)
    if @workout.save
      redirect_to program_workout_path(@program, @workout), notice: "Your workout was successfully created."
    else
      render :form, status: :unprocessable_entity
    end
  end

  def destroy
    @workout.destroy
    redirect_to program_workouts_path(@program), notice: "Workout deleted successfully."
  end

  def copy_exercise
    @template_exercises = Exercise.where(template: true).includes(:primary_muscle_group)
    @muscle_groups = MuscleGroup.where(template: true).order(created_at: :asc)
  end

  def start_workout
    @exercise_set = @workout.exercise_groups.find_by(order: 1).exercises.first.exercise_sets.find_by(order: 1)
    @exercise = @exercise_set.exercise
    @exercise_group = @exercise.exercise_group
    @workout = @exercise_group.workout
    @program = @workout.program
    redirect_to play_set_program_workout_exercise_exercise_set_path(@program, @workout, @exercise, @exercise_set, prev_set: nil)
  end

  def preview_workout
  end

  private

  def empty_workout
    if @workout.exercise_groups.empty?
      error = "This workout has no exercises yet. Please add exercises to start."
    elsif @workout.exercise_groups.first.exercises.first.exercise_sets.empty?
      error = "This workout has no sets yet. Please add sets to the first exercise to start."
    end
    if error
      redirect_to program_workout_path(@program, @workout), alert: error
    end
  end

  def set_program
    @program = Program.find(params[:program_id])
  end

  def set_workout
    @workout = @program.workouts.find(params[:id])
  end

  def authorize_workout
    unless authorize
      redirect_to program_workouts_path(@program), alert: "Not allowed to modify this workout."
    end
  end

  def workout_params
    params.require(:workout).permit(:name, :goal, :rest_days, exercise_ids: [])
  end
end
