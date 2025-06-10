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
    order = (@workout&.exercise_groups.select{ |eg| eg.exercises.any? }.map(&:order).max || 0) + 1
    @exercise_group = @workout.exercise_groups.find_by(order: order)
    unless @exercise_group
      @exercise_group = @workout.exercise_groups.new(order: order)
      @exercise_group.save!
    end
    @exercise = @exercise_group.exercises.new
    render :form
  end

  def create
    @exercise_group = @workout.exercise_groups.find(exercise_params[:exercise_group_id])
    @exercise = @exercise_group.exercises.new(exercise_params)
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

  def duplicate
    original = Exercise.find(params[:id])
    copy = original.dup
    copy.save!
    redirect_to edit_program_workout_exercise_path(@program, @workout, copy), notice: "Exercise duplicated."
  end

  def dummy_sets
    unit_id = current_user.weight_unit&.id || Unit.where(unit_type: "Weight").first
    dummy_sets = [
      { order: 1, set_type: "Warmup Set", reps: 10 },
      { order: 2, set_type: "Warmup Set", reps: 5  },
      { order: 3, set_type: "Warmup Set", reps: 3  },
      { order: 4, set_type: "Working Set", reps: @exercise.rep_range_min, intensity: 8  },
      { order: 5, set_type: "Working Set", reps: @exercise.rep_range_min, intensity: 9  },
      { order: 6, set_type: "Working Set", reps: @exercise.rep_range_min, intensity: 10 }
    ]
    dummy_sets.each do |set|
      ds = @exercise.exercise_sets.new(order: set[:order], set_type: set[:set_type], reps: set[:reps], unit: unit_id, intensity: set[:intensity])
      ds.save!
    end
    redirect_to program_workout_exercise_exercise_sets_path(@program, @workout, @exercise), notice: "Dummy sets created."
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
