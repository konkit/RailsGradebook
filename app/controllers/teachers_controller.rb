class TeachersController < ApplicationController
  include HandlingResourceJsonActions

  before_action :set_teacher, only: [:update, :destroy]
  load_and_authorize_resource

  def subjects_and_divisions
    @subjects = Subject.includes(:divisions).where( teacher: current_user )
  end

  def get_grades
    @students = Student.get_student_grades_map(params[:division_id], params[:subject_id])
  end

  #############

  # GET /teachers
  # GET /teachers.json
  def index
    @teachers = Teacher.all
  end

    # POST /teachers
  # POST /teachers.json
  def create
    @teacher = Teacher.new(teacher_params)
    handle_create(@teacher)
  end

  # PATCH/PUT /teachers/1
  # PATCH/PUT /teachers/1.json
  def update
    handle_update(@teacher, teacher_params)
  end

  # DELETE /teachers/1
  # DELETE /teachers/1.json
  def destroy
    handle_destroy(@teacher)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_teacher
      @teacher = Teacher.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def teacher_params
      params.require(:teacher).permit(:name, :email, :password, :password_confirmation)
    end
end
