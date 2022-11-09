class TeachersController < ApplicationController
  before_action :_set_teacher, only: [:update, :destroy]

  def index
    render json: _relevant_teachers
  end

  def create
    @teacher = Teacher.new(_teacher_params)

    if @teacher.save
      render json: @teacher
    else
      render json: 500
    end
  end

  def update
    if @teacher.update_attributes(_teacher_params)
      render json: @teacher
    else
      render json: 500
    end
  end

  def destroy
    @teacher.destroy ? render json: 200 : render json: 500
  end

  private

  # we'll need a way of limiting this in the future
  def _relevant_teachers
    @teachers = Teachers.all
  end

  def _set_teacher
    @teacher = Teacher.find(params[:id])
  end

  def _teacher_params
    params.require(:teacher).permit(
      :first_name,
      :last_name,
      :email_address,
      :email_verified,
      :mobile_phone_number,
      :birthday
    )
  end
end
