class DivisionsController < ApplicationController
  before_action :set_division, only: [:update, :destroy]

  # GET /divisions
  # GET /divisions.json
  def index
    @divisions = Division.all
  end

  # POST /divisions
  # POST /divisions.json
  def create
    @division = Division.new(division_params)

    if @division.save
      render json: {errors: ""}, status: :created, location: @division
    else
      render json: {errors: @division.errors}, status: :unprocessable_entity
    end
  rescue StandardError => e
    render json: { errors: e.message }, status: :unprocessable_entity
  end

  # PATCH/PUT /divisions/1
  # PATCH/PUT /divisions/1.json
  def update
    @division.subjects = get_subjects_ids
    @division.save
    if @division.update(division_params)
      render json: {errors: ""}, status: :ok, location: @division
    else
      render json: {errors: @division.errors}, status: :unprocessable_entity
    end
  rescue StandardError => e
    render json: { errors: e.message }, status: :unprocessable_entity
  end

  # DELETE /divisions/1
  # DELETE /divisions/1.json
  def destroy
    @division.destroy
    head :no_content
  rescue StandardError => e
    render json: { errors: e.message }, status: :unprocessable_entity
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_division
      @division = Division.find(params[:id])
    end

    def get_subjects_ids
      subject_params = params[:subjects] || []
      Subject.find(subject_params.map{|x| x[:id] })
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def division_params
      params.require(:division).permit(:name, :id)
    end
end
