class WorkoutsController < ApplicationController
  before_action :set_program
  before_action :set_workout, except: [:index, :new, :create]

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
    render 'exercise_sets/play_set'
  end

  private

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
