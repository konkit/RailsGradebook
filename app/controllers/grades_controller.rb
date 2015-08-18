class GradesController < ApplicationController
  respond_to :json
  before_action :set_grade, only: [:update, :destroy]

  # POST /grades
  # POST /grades.json
  def create
    @grade = Grade.new(grade_params)
    authorize! :create, @grade
    handle_create(@grade)
  end

  # PATCH/PUT /grades/1
  # PATCH/PUT /grades/1.json
  def update
    authorize! :update, @grade
    handle_update(@grade, grade_params)
  end

  # DELETE /grades/1
  # DELETE /grades/1.json
  def destroy
    handle_destroy(@grade)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grade
      @grade = Grade.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def grade_params
      params.require(:grade).permit(:gradevalue, :subject_id, :student_id)
    end
end
