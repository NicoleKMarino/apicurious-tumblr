class PostsController < ApplicationController

  def update
    services.reblog(params[:id], params[:key])
    flash[:success] = "Post Reblogged"
  end

  def like
    services.like_post(params[:id], params[:key])
    redirect_to root_path
  end


end
