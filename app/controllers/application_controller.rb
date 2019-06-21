# frozen_string_literal: true

class ApplicationController < ActionController::Base
  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.html { redirect_to main_app.tasks_url, notice: exception.message }
    end
  end
end
