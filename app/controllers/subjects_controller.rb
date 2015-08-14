class SubjectsController < ApplicationController
  before_action :set_subject, only: [:show, :edit, :update, :destroy]

  # GET /subjects
  # GET /subjects.json
  def index
    @subjects = Subject.includes(:teacher).all
  end

  # POST /subjects
  # POST /subjects.json
  def create
    @subject = Subject.new(subject_params)

    if @subject.save
      render json: {errors: ""}, status: :created, location: @subject
    else
      render json: {errors: @subject.errors}, status: :unprocessable_entity
    end
  rescue StandardError => e
    render json: { errors: e.message }, status: :unprocessable_entity
  end

  # PATCH/PUT /subjects/1
  # PATCH/PUT /subjects/1.json
  def update
    if @subject.update(subject_params)
      render json: {errors: ""}, status: :ok, location: @subject
    else
      render json: {errors: @subject.errors}, status: :unprocessable_entity
    end
  rescue StandardError => e
    render json: { errors: e.message }, status: :unprocessable_entity
  end

  # DELETE /subjects/1
  # DELETE /subjects/1.json
  def destroy
    @subject.destroy
    head :no_content
  rescue StandardError => e
    render json: { errors: e.message }, status: :unprocessable_entity
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subject
      @subject = Subject.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subject_params
      params.require(:subject).permit(:name, :teacher_id)
    end
end
