class WorkoutsController < ApplicationController
  before_action :set_program
  before_action :set_workout, except: [:index, :new, :create]
  before_action :empty_workout, only: [:start_workout, :preview_workout]

  def index
    @workouts = @program.workouts
  end

  def show
  end

  def edit
    render :form
  end

  def update
    if @workout.update(workout_params)
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
      redirect_to program_workouts_path(@program), notice: "Your workout was successfully created."
    else
      render :form, status: :unprocessable_entity
    end
  end

  def destroy
    @workout.destroy
    redirect_to program_workouts_path(@program), notice: "Workout deleted successfully."
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
    @program = current_user.programs.find(params[:program_id])
  end

  def set_workout
    @workout = @program.workouts.find(params[:id])
  end

  def workout_params
    params.require(:workout).permit(:name, :goal, :rest_days)
  end
end
