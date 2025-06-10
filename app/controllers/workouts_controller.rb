class WorkoutsController < ApplicationController
  before_action :set_program
  before_action :set_workout, except: [:index, :new, :create]

  def index
    @workouts = @program.workouts
  end

  def show; end

  def edit; end

  def update
    if @workout.update(workout_params)
      redirect_to program_workout_path(@program, @workout), notice: "Workout updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @workout.destroy
    redirect_to program_workouts_path(@program), notice: "Workout deleted successfully."
  end

  private

  def set_program
    @program = current_user.programs.find(params[:program_id])
  end

  def set_workout
    @workout = @program.workouts.find(params[:id])
  end

  def workout_params
    params.require(:workout).permit(:name, :frequency, :level, :goal, :duration, :unit_id)
  end
end
