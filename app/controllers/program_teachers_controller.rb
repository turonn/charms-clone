class ProgramTeachersController < ApplicationController
  before_action :_set_program_teacher, only: [:update, :destroy]

  def index
    render json: _relevant_program_teachers
  end

  def create
    @program_teacher = Teacher.new(_program_teacher_params)

    if @program_teacher.save
      render json: @program_teacher
    else
      render json: 500
    end
  end

  def update
    if @program_teacher.update_attributes(_program_teacher_params)
      render json: @program_teacher
    else
      render json: 500
    end
  end

  def destroy
    @program_teacher.destroy ? render json: 200 : render json: 500
  end

  private

  # we'll need a way of limiting this in the future
  def _relevant_program_teachers
    @program_teachers = ProgramTeachers.all
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
