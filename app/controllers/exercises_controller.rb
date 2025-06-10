class ExercisesController < ApplicationController
  before_action :set_program
  before_action :set_workout
  before_action :set_exercise, except: [:index, :new, :create]

  def index
    @exercises = @workout.exercise_groups.order(:order).includes(:exercises).flat_map(&:exercises)
  end

  def show
  end

  def edit
    render :form
  end

  def update
    if @exercise.update(exercise_params)
      redirect_to program_workout_exercises_path(@program, @workout), notice: "Exercise updated successfully."
    else
      render :form, status: :unprocessable_entity
    end
  end

  def new
    @exercise = @workout.exercises.new
    render :form
  end

  def create
    @exercise = @workout.exercises.new(exercise_params)
    if @exercise.save
      redirect_to program_workout_exercises_path(@program, @workout), notice: "Your exercise was successfully created."
    else
      render :form, status: :unprocessable_entity
    end
  end

  def destroy
    exercise_group = @exercise.exercise_group
    if exercise_group.exercises.one?
      higher_order_groups = @workout.exercise_groups.where("exercise_groups.order > ?", exercise_group.order)
      higher_order_groups.each do |eg|
        eg.update(order: eg.order - 1)
      end
      exercise_group.destroy
    end
    @exercise.destroy
    redirect_to program_workout_exercises_path(@program, @workout), notice: "Exercise deleted successfully."
  end

  private

  def set_program
    @program = current_user.programs.find(params[:program_id])
  end

  def set_workout
    @workout = @program.workouts.find(params[:workout_id])
  end

  def set_exercise
    @exercise = @workout.exercises.find(params[:id])
  end

  def exercise_params
    params.require(:exercise).permit(:name, :notes, :exercise_type, :rep_range_min, :rep_range_max, :rest_time, :unilateral, :exercise_group_id, :instrument_id, :unit_id)
  end
end
