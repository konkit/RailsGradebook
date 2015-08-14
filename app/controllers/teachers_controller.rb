class TeachersController < ApplicationController
  before_action :set_teacher, only: [:show, :edit, :update, :destroy]

  def subjects_and_divisions
    teacher = current_user
    render json: subjects = Subject.includes(:divisions).where( teacher: teacher ).as_json(:include => :divisions)
  end

  def get_grades
    render json: Grade.includes( :subject, :student => :division )
      .where( users: { division_id: params[:division_id]}, subjects: { id: params[:subject_id]} )
      .group_by { |grade| grade.student }
      .map { |student, grade|
        { student: student, grades: grade }
      }
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

    if @teacher.save
      render :show, status: :created, location: @teacher
    else
      render json: { errors: @teacher.errors}, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /teachers/1
  # PATCH/PUT /teachers/1.json
  def update
    if @teacher.update(teacher_params)
      render json: {errors: ""}, status: :ok, location: @teacher
    else
      render json: {errors: @teacher.errors}, status: :unprocessable_entity
    end
  end

  # DELETE /teachers/1
  # DELETE /teachers/1.json
  def destroy
    @teacher.destroy
    head :no_content
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
