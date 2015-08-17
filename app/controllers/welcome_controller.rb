class WelcomeController < ApplicationController
  def index
  end

  def get_current_user
    render json: {
      email: current_user.try(:email),
      name: current_user.try(:name),
      id: current_user.try(:id),
      role: current_user.try(:role)
    }
  end
end
