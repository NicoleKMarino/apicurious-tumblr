class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :current_client
  helper_method :embed_post


  helper_method :services

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end


  def services
    @service ||= TumblrService.new(current_user)
  end

  def parse(response)
    JSON.parse(response)
  end



end
