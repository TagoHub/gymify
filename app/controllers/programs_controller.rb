class ProgramsController < ApplicationController
  before_action :set_program, except: :index

  def show
  end

  def index
    @programs = current_user.programs
  end

  def edit
  end

  def update
    if @program.update(program_params)
      redirect_to @program, notice: "Your program was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @program.destroy
    redirect_to users_path, notice: "User was successfully deleted."
  end

  private

  def set_program
    @program = current_user.programs.find(params[:id])
  end

  def program_params
    params.require(:program).permit(:name, :frequency, :level, :goal, :duration, :unit_id)
  end
end