class ApplicationController < ActionController::Base
  # Set a dummy user before each action for demonstration purposes
  before_action :set_dummy_user

  helper_method :current_user

  private

  # Find the first User or create one if none exists
  def set_dummy_user
    @current_user = User.first_or_create!(name: "Bhavesh Saluja")
  end

  # Provide access to the current user
  def current_user
    @current_user
  end
end
