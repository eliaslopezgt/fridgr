class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  after_filter :add_flash_to_header
  def add_flash_to_header
    session[:flash_notice] = flash[:notice] unless flash[:notice].blank?
  end
end
