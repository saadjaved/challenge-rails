class LandingExceptionsController < ApplicationController
  def back_end_error
    exception = params[:exception]
    flash[:error] = "#{ I18n.translate(:http_backend_error)} : #{ exception }"
  end
end
