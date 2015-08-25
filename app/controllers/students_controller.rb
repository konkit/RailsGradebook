class StudentsController < ApplicationController
  include HandlingResourceJsonActions

  before_action :set_student, only: [:update, :destroy]
  respond_to :json
  load_and_authorize_resource

  def get_students_grades
    @student = Student.includes(:grades => :subject).find(current_user.id)
    authorize! :get_students_grades, @student
  end

  def index
    @students = Student.all
  end

  def create
    @student = Student.new(student_params)
    handle_create(@student)
  end

  def update
    handle_update(@student, student_params)
  end

  def destroy
    handle_destroy(@student)
  end

  private
    def set_student
      @student = Student.find(params[:id])
    end

    def student_params
      params.require(:student).permit(:name, :email, :password, :password_confirmation, :division_id)
    end
end
