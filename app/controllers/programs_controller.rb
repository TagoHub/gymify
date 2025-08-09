class ProgramsController < ApplicationController
  before_action :set_program, except: [:index, :new, :create, :quick_start]
  before_action :authorize_program, only: [:destroy, :edit, :update]

  def show
  end

  def index
    @programs = current_user.programs
  end

  def edit
    render :form
  end

  def update
    if @program.update(program_params)
      redirect_to @program, notice: "Your program was successfully updated."
    else
      render :form
    end
  end

  def destroy
    @program.destroy
    redirect_to programs_path, notice: "Program was successfully deleted."
  end

  def new
    @program = current_user.programs.new
    render :form
  end

  def create
    @program = current_user.programs.new(program_params)
    if @program.save
      redirect_to @program, notice: "Your program was successfully created."
    else
      render :form, status: :unprocessable_entity
    end
  end

  def quick_start
    @programs = current_user.programs
  end

  private

  def set_program
    @program = Program.find(params[:id])
  end

  def authorize_program
    unless authorize
      redirect_to programs_path(), alert: "Not allowed to modify this program."
    end
  end

  def program_params
    params.require(:program).permit(:name, :frequency, :level, :goal, :duration, :unit_id)
  end
end