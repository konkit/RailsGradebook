class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]
  respond_to :json

  def view_students_grades
    @student = Student.find(params[:id])
    authorize! :view_students_grades, student
    respond_with @student.grades
      .group_by { |grade| grade.subject }
      .map { |subject, grades|
        {
          student: { id: @student.id, name: @student.name},
          subject: { name: subject.name, id: subject.id},
          grades: grades.map { |grade|
            {
              id: grade.id, value: grade.gradevalue
            }
          }
        }
      }
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

    if @student.save
      render json: {errors: "" } status: :created, location: @student
    else
      render json: { errors: @student.errors }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    if @student.update(student_params)
      render json: { errors: "" }, status: :ok, location: @student
    else
      render json: { errors: @student.errors }, status: :unprocessable_entity
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student.destroy
    head :no_content
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
