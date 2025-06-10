class ExerciseSetsController < ApplicationController
  before_action :set_program
  before_action :set_workout
  before_action :set_exercise
  before_action :set_exercise_set, except: [:index, :new, :create]

  def index
    @exercise_sets = @exercise.exercise_sets.order(:order)
  end

  def show
  end

  def edit
    render :form
  end

  def update
    if @exercise_set.update(exercise_set_params)
      redirect_to program_workout_exercise_exercise_sets_path(@program, @workout, @exercise), notice: "Set updated successfully."
    else
      render :form, status: :unprocessable_entity
    end
  end

  def new
    @exercise_set = @exercise.exercise_sets.new(order: (@exercise.exercise_sets.map(&:order).max || 0) + 1)
    render :form
  end

  def create
    @exercise_set = @exercise.exercise_sets.new(exercise_set_params)
    if @exercise_set.save
      redirect_to program_workout_exercise_exercise_sets_path(@program, @workout, @exercise), notice: "Your set was successfully created."
    else
      render :form, status: :unprocessable_entity
    end
  end

  def destroy
    if @exercise.exercise_sets.one?
      @exercise.destroy
    end
    @exercise_set.destroy
    redirect_to program_workout_exercise_exercise_sets_path(@program, @workout, @exercise), notice: "Set deleted successfully."
  end

  private

  def set_program
    @program = current_user.programs.find(params[:program_id])
  end

  def set_workout
    @workout = @program.workouts.find(params[:workout_id])
  end

  def set_exercise
    @exercise = @workout.exercises.find(params[:exercise_id])
  end

  def set_exercise_set
    @exercise_set = @exercise.exercise_sets.find(params[:id])
  end

  def exercise_set_params
    params.require(:exercise_set).permit(:order, :set_type, :reps, :load, :unit_id, :intensity, :intensity_technique_id, :exercise_id)
  end
end
