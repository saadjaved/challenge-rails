class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  rescue_from RailsChallengeErrors::BackendError, :with => :handle_backend_errors

private
  def handle_backend_errors(exception)
    redirect_to landing_exceptions_back_end_error_path(exception: exception)
  end
end
