class SubjectsController < ApplicationController
  before_action :set_subject, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /subjects
  # GET /subjects.json
  def index
    @subjects = Subject.includes(:teacher).all
  end

  # POST /subjects
  # POST /subjects.json
  def create
    @subject = Subject.new(subject_params)
    handle_create(@subject)
  end

  # PATCH/PUT /subjects/1
  # PATCH/PUT /subjects/1.json
  def update
    handle_update(@subject, subject_params)
  end

  # DELETE /subjects/1
  # DELETE /subjects/1.json
  def destroy
    handle_destroy(@subject)
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
