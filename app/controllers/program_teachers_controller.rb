class ProgramTeachersController < ApplicationController
  def index
    program_teachers = _relevant_program_teachers
    render json: { status: 'SUCCESS', message: 'program_teachers loaded', data: program_teachers }, status: :ok
  end

  def show
    program = ProgramTeacher.find(params[:id])
    render json: { status: 'SUCCESS', message: 'program loaded', data: program }, status: :ok
  end

  def create
    program_teacher = ProgramTeacher.new(_program_params)

    if program_teacher.save
      render json: { status: 'SUCCESS', message: 'program_teacher created', data: program_teacher }, status: :ok
    else
      render json: { status: 'ERROR', message: 'program_teacher failed to create', data: program_teacher.errors },
             status: :unprocessable_entitiy
    end
  end

  def update
    program_teacher = ProgramTeacher.find(params[:id])

    if program_teacher.update_attributes(_program_teacher_params)
      render json: { status: 'SUCCESS', message: 'program_teacher updated', data: program_teacher }, status: :ok
    else
      render json: { status: 'ERROR', message: 'program_teacher failed to update', data: program_teacher.errors },
             status: :unprocessable_entitiy
    end
  end

  def destroy
    program_teacher = ProgramTeacher.find(params[:id])

    if program.destroy
      render json: { status: 'SUCCESS', message: 'program_teacher deleted', data: program_teacher }, status: :ok
    else
      render json: { status: 'ERROR', message: 'program_teacher not deleted', data: program_teacher.errors },
             status: :unprocessable_entitiy
    end
  end

  private

  # we'll need a way of limiting this in the future
  def _relevant_program_teachers
    ProgramTeacher.all
  end

  def _set_program_teacher
    program_teacher = ProgramTeacher.find_by(params[:id])
  end

  def _program_teacher_params
    params.require(:program_teacher).permit(
      :program_id,
      :teacher_id
    )
  end
end
