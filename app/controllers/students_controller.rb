class StudentsController < ApplicationController
  include HandlingResourceJsonActions

  before_action :set_student, only: [:update, :destroy]
  respond_to :json
  load_and_authorize_resource

  def get_students_grades
    @student = Student.includes(:grades => :subject).find(current_user.id)
    authorize! :get_students_grades, @student
  end

  #############

  # GET /students
  # GET /students.json
  def index
    @students = Student.all
  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(student_params)
    handle_create(@student)
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    handle_update(@student, student_params)
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    handle_destroy(@student)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:student).permit(:name, :email, :password, :password_confirmation, :division_id)
    end
end
