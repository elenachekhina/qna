# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit::Authorization

  rescue_from Pundit::NotAuthorizedError do |_exception|
    respond_to do |format|
      # format.turbo_stream do
      #   # Render a turbo_stream response that sets a flash message
      #   render turbo_stream: turbo_stream.update("flash", partial: "shared/flash", locals: { message: "You are not authorized to perform this action." })
      # end
      format.html do
        # Set a flash message with the error
        flash[:alert] = 'You are not authorized to perform this action.'

        # Redirect back or to a specific page
        redirect_to(request.referrer || root_path)
      end
    end
    # , alert: exception.message
  end
end
