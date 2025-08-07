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
    play = exercise_set_params[:play]
    @alternate = exercise_set_params[:alternate]
    if @exercise_set.update(exercise_set_params.except(:play, :alternate))
      if play
        @prev_set = @exercise_set
        @exercise_set = @exercise_set.next_set unless @alternate
        if @exercise_set
          @exercise = @exercise_set.exercise
          @exercise_group = @exercise.exercise_group
          @workout = @exercise_group.workout
          @program = @workout.program
          redirect_to play_set_program_workout_exercise_exercise_set_path(@program, @workout, @exercise, @exercise_set, prev_set: @prev_set, alternate: @alternate)
        else
          message = @workout.rest_days > 0 ? "Workout completed congratulations! Remember to rest #{@workout.rest_days} days" : "Workout completed congratulations!"
          redirect_to program_workout_path(@program, @workout), notice: message
        end
      else
        redirect_to program_workout_exercise_exercise_sets_path(@program, @workout, @exercise), notice: "Set updated successfully."
      end
    else
      render :form, status: :unprocessable_entity
    end
  end

  def new
    @exercise_set = @exercise.exercise_sets.new(order: (@exercise.exercise_sets.map(&:order).max || 0) + 1)
    render :form
  end

  def create
    @exercise_set = @exercise.exercise_sets.new(exercise_set_params.except(:play))
    if @exercise_set.save
      redirect_to program_workout_exercise_exercise_sets_path(@program, @workout, @exercise), notice: "Your set was successfully created."
    else
      render :form, status: :unprocessable_entity
    end
  end

  def destroy
    @exercise_set.destroy
    redirect_to program_workout_exercise_exercise_sets_path(@program, @workout, @exercise), notice: "Set deleted successfully."
  end

  def duplicate
    original = ExerciseSet.find(params[:id])
    copy = original.dup
    copy.order = original.order + 1
    copy.save!
    redirect_to edit_program_workout_exercise_exercise_set_path(@program, @workout, @exercise, copy), notice: "Exercise duplicated."
  end

  def play_set
    @prev_set = ExerciseSet.find(params[:prev_set]) if params[:prev_set].present?
    @exercise = @exercise_set.exercise
    @exercise_group = @exercise.exercise_group
    @workout = @exercise_group.workout
    @alternate = params[:alternate]
  end

  private

  def set_program
    @program = Program.find(params[:program_id])
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
    params.require(:exercise_set).permit(:play, :order, :set_type, :reps, :load, :unit_id, :intensity, :suggested_intensity,
      :intensity_technique_id, :exercise_id, :alternate)
  end
end
