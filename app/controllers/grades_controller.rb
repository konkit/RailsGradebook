class GradesController < ApplicationController
  respond_to :json
  before_action :set_grade, only: [:update, :destroy]

  # POST /grades
  # POST /grades.json
  def create
    @grade = Grade.new(grade_params)
    authorize! :create, @grade
    if @grade.save
      render :show, status: :created, location: @grade
    else
      render json: @grade.errors, status: :unprocessable_entity
    end
  rescue StandardError => e
    render json: { errors: e.message }, status: :unprocessable_entity
  end

  # PATCH/PUT /grades/1
  # PATCH/PUT /grades/1.json
  def update
    authorize! :update, @grade
    if @grade.update(grade_params)
      render :show, status: :ok, location: @grade
    else
      render json: {errors: @grade.errors}, status: :unprocessable_entity
    end
  rescue StandardError => e
    render json: { errors: e.message }, status: :unprocessable_entity
  end

  # DELETE /grades/1
  # DELETE /grades/1.json
  def destroy
    authorize! :destroy, @grade
    @grade.destroy
    head :no_content
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
