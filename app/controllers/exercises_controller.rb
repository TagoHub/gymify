class ExercisesController < ApplicationController
  before_action :set_program, except: [:templates]
  before_action :set_workout, except: [:templates]
  before_action :set_exercise, except: [:index, :new, :create, :templates]
  before_action :authorize_exercise, only: [:new, :create, :destroy, :edit, :update]
  before_action :form_options, only: [:new, :create, :edit, :update]

  def index
    @exercises = @workout.exercise_groups.order(:order).includes(:exercises).flat_map(&:exercises)
  end

  def show
  end

  def edit
    render :form
  end

  def update
    warmup_sets = exercise_params[:warmup_sets]&.to_i
    working_sets = exercise_params[:working_sets]&.to_i
    unit = exercise_params[:unit_id]&.to_i
    if warmup_sets && working_sets && unit
      current_set = 1
      warmup_sets.times do
        ds = @exercise.exercise_sets.new(order: current_set, set_type: "Warmup Set", reps: 5, unit_id: unit, suggested_intensity: 5)
        ds.save!
        current_set += 1
      end
      working_sets.times do
        ds = @exercise.exercise_sets.new(order: current_set, set_type: "Working Set", reps: @exercise.rep_range_min, unit_id: unit, suggested_intensity: 8)
        ds.save!
        current_set += 1
      end
      redirect_to program_workout_exercise_exercise_sets_path(@program, @workout, @exercise), notice: "Exercise sets created successfully."
    elsif @exercise.update(exercise_params)
      respond_to do |format|
        format.html { redirect_to program_workout_exercises_path(@program, @workout), notice: "Exercise updated successfully." }
        format.json { render json: { notes: @exercise.notes, id: @exercise.id } }
      end
    else
      respond_to do |format|
        format.html { render :form, status: :unprocessable_entity }
        format.json { render json: { errors: @exercise.errors.full_messages }, status: :unprocessable_entity }
      end
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

  def templates
    template_exercises = Exercise.where(template: true).includes(:instrument, :unit, :muscles)
    @muscle_group = MuscleGroup.find(params[:muscle_group]) if params[:muscle_group]
    @muscle_group ||= MuscleGroup.find_by(name: "Back")
    @muscle = Muscle.find(params[:muscle]) if params[:muscle]
    @template_exercises = template_exercises.where(primary_muscle_group_id: @muscle_group)
    if @muscle
      @template_exercises = @template_exercises.select{ |e| e.muscles.include?(@muscle) }
    end
    @select_options = MuscleGroup.where(template: true).order(created_at: :asc)
    @workout = @template_exercises.first&.exercise_group&.workout
    @program = @workout&.program
  end

  def duplicate
    original = Exercise.find(params[:id])
    copy = original.dup
    copy.save!
    redirect_to edit_program_workout_exercise_path(@program, @workout, copy), notice: "Exercise duplicated."
  end

  def quick_sets_creation
  end

  private

  def set_program
    @program = Program.find(params[:program_id])
  end

  def set_workout
    @workout = @program.workouts.find(params[:workout_id])
  end

  def set_exercise
    @exercise = @workout.exercises.find(params[:id])
  end

  def form_options
    @exercise_groups = @workout.exercise_groups.order(:order)
    @exercise_types = ["Compound", "Isolation"]
    @boolean = [["No", false], ["Yes", true]]
    @instruments =  Instrument.all
    @attachments = Attachment.all
    @grips = Grip.all
    @units = Unit.where(unit_type: "Time")
  end

  def authorize_exercise
    unless authorize
      redirect_to program_workout_exercises_path(@program, @workout), alert: "Not allowed to modify this exercise."
    end
  end

  def exercise_params
    params.require(:exercise).permit(:name, :image, :notes, :exercise_type, :rep_range_min, :rep_range_max, :rest_time, :unilateral, :exercise_group_id,
      :body_weight, :instrument_id, :attachment_id, :hole, :grip_id, :unit_id, :warmup_sets, :working_sets)
  end
end
