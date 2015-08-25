class TeachersController < ApplicationController
  include HandlingResourceJsonActions

  before_action :set_teacher, only: [:update, :destroy]
  load_and_authorize_resource

  def subjects_and_divisions
    @subjects = Subject.includes(:divisions).where(teacher: current_user)
  end

  def get_grades
    @students = Student.get_student_grades_map(params[:division_id], params[:subject_id])
  end

  def index
    @teachers = Teacher.all
  end

  def create
    @teacher = Teacher.new(teacher_params)
    handle_create(@teacher)
  end

  def update
    handle_update(@teacher, teacher_params)
  end

  def destroy
    handle_destroy(@teacher)
  end

  private
    def set_teacher
      @teacher = Teacher.find(params[:id])
    end

    def teacher_params
      params.require(:teacher).permit(:name, :email, :password, :password_confirmation)
    end
end
