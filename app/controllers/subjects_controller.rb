class SubjectsController < ApplicationController
  include HandlingResourceJsonActions

  before_action :set_subject, only: [:update, :destroy]
  load_and_authorize_resource

  def index
    @subjects = Subject.includes(:teacher).all
  end

  def create
    @subject = Subject.new(subject_params)
    handle_create(@subject)
  end

  def update
    handle_update(@subject, subject_params)
  end

  def destroy
    handle_destroy(@subject)
  end

  private
    def set_subject
      @subject = Subject.find(params[:id])
    end

    def subject_params
      params.require(:subject).permit(:name, :teacher_id)
    end
end
