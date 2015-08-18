class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

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
