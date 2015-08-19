class TeachersController < ApplicationController
  include HandlingResourceJsonActions

  before_action :set_teacher, only: [:update, :destroy]
  load_and_authorize_resource

  def subjects_and_divisions
    teacher = current_user
    render json: subjects = Subject.includes(:divisions).where( teacher: teacher ).as_json(:include => :divisions)
  end

  def get_grades
    @students = Student.includes(:grades).where(division_id: params[:division_id]).map do |student|
      {
        student: student,
        grades: student.grades.where(subject_id: params[:subject_id])
      }
    end
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
