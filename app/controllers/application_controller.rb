# frozen_string_literal: true
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :user_signed_in?
  helper_method :correct_user?

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  rescue Exception => e
    nil
  end

  def user_signed_in?
    return true if current_user
  end

  def correct_user?
    @user = User.find(params[:id])
    redirect_to root_url, alert: 'Access denied.' unless current_user == @user
  end

  def authenticate_user!
    unless current_user
      redirect_to root_url, alert: 'You need to sign in for access to this page.'
    end
  end
end
