class TeachersController < ApplicationController
  def index
    teachers = _relevant_teachers
    render json: { status: 'SUCCESS', message: 'teachers loaded', data: teachers }, status: :ok
  end

  def show
    teacher = Teacher.find(params[:id])
    render json: { status: 'SUCCESS', message: 'teacher loaded', data: teacher }, status: :ok
  end

  def create
    teacher = Teacher.new(_teacher_params)

    if teacher.save
      render json: { status: 'SUCCESS', message: 'teacher created', data: teacher }, status: :ok
    else
      render json: { status: 'ERROR', message: 'teacher failed to create', data: teacher.errors },
             status: :unprocessable_entitiy
    end
  end

  def update
    teacher = Teacher.find(params[:id])

    if teacher.update_attributes(_teacher_params)
      render json: { status: 'SUCCESS', message: 'teacher updated', data: teacher }, status: :ok
    else
      render json: { status: 'ERROR', message: 'teacher failed to update', data: teacher.errors },
             status: :unprocessable_entitiy
    end
  end

  def destroy
    teacher = Teacher.find(params[:id])

    if teacher.destroy
      render json: { status: 'SUCCESS', message: 'teacher deleted', data: teacher }, status: :ok
    else
      render json: { status: 'ERROR', message: 'teacher not deleted', data: teacher.errors },
             status: :unprocessable_entitiy
    end
  end

  private

  # we'll need a way of limiting this in the future
  def _relevant_teachers
    Teachers.all
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
