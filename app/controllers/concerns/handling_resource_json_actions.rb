module HandlingResourceJsonActions
  extend ActiveSupport::Concern

  def handle_create(resourceObj)
    if resourceObj.save
      render json: {errors: []}, status: :created, location: resourceObj
    else
      render json: {errors: resourceObj.errors.full_messages}, status: :unprocessable_entity
    end
  rescue StandardError => e
    render json: { errors: [e.message] }, status: :unprocessable_entity
  end

  def handle_update(resourceObj, params)
    if resourceObj.update(params)
      render json: {errors: []}, status: :ok, location: resourceObj
    else
      render json: {errors: resourceObj.errors.full_messages}, status: :unprocessable_entity
    end
  rescue StandardError => e
    render json: { errors: [e.message] }, status: :unprocessable_entity
  end

  def handle_destroy(resourceObj)
    resourceObj.destroy
    head :no_content
  rescue StandardError => e
    render json: { errors: [e.message] }, status: :unprocessable_entity
  end

end
