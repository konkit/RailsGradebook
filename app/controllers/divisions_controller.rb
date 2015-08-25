class DivisionsController < ApplicationController
  include  HandlingResourceJsonActions

  before_action :set_division, only: [:update, :destroy]
  load_and_authorize_resource

  def index
    @divisions = Division.all
  end

  def create
    @division = Division.new(division_params)
    handle_create(@division)
  end

  def update
    @division.subjects = get_subjects_ids
    @division.save
    handle_update(@division, division_params)
  end

  def destroy
    handle_destroy(@division)
  end

  private
    def set_division
      @division = Division.find(params[:id])
    end

    def get_subjects_ids
      subject_params = params[:subjects] || []
      Subject.find(subject_params.map{|x| x[:id] })
    end

    def division_params
      params.require(:division).permit(:name, :id)
    end
end
