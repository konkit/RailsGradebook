class GradesController < ApplicationController
  include HandlingResourceJsonActions

  before_action :set_grade, only: [:update, :destroy]
  load_and_authorize_resource

  def create
    @grade = Grade.new(grade_params)
    handle_create(@grade)
  end

  def update
    handle_update(@grade, grade_params)
  end

  def destroy
    handle_destroy(@grade)
  end

  private
    def set_grade
      @grade = Grade.find(params[:id])
    end

    def grade_params
      params.require(:grade).permit(:gradevalue, :subject_id, :student_id)
    end
end
