class SessionsController < ApplicationController

  def create
    if user = User.from_omniauth(request.env["omniauth.auth"])
      session[:user_id] = user.id
    end
    redirect_to root_path
  end

  def delete
    session.clear
    flash[:notice] = "Goodbye!"
    redirect_to root_path
  end

end
