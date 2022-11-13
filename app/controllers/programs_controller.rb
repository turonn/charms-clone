class ProgramsController < ApplicationController
  def index
    programs = _relevant_programs
    render json: { status: 'SUCCESS', message: 'programs loaded', data: programs }, status: :ok
  end

  def show
    program = Program.find(params[:id])
    render json: { status: 'SUCCESS', message: 'program loaded', data: program }, status: :ok
  end

  def create
    program = Program.new(_program_params)

    if program.save
      render json: { status: 'SUCCESS', message: 'program created', data: program }, status: :ok
    else
      render json: { status: 'ERROR', message: 'program failed to create', data: program.errors },
             status: :unprocessable_entitiy
    end
  end

  def update
    program = Program.find(params[:id])

    if program.update_attributes(_program_params)
      render json: { status: 'SUCCESS', message: 'program updated', data: program }, status: :ok
    else
      render json: { status: 'ERROR', message: 'program failed to update', data: program.errors },
             status: :unprocessable_entitiy
    end
  end

  def destroy
    program = Program.find(params[:id])

    if program.destroy
      render json: { status: 'SUCCESS', message: 'program deleted', data: program }, status: :ok
    else
      render json: { status: 'ERROR', message: 'program not deleted', data: program.errors },
             status: :unprocessable_entitiy
    end
  end

  private

  # we'll need a way of limiting this in the future
  def _relevant_programs
    @programs = Programs.all
  end

  def _program_params
    params.require(:program).permit(
      :name,
      :description
    )
  end
end
