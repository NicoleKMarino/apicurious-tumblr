class UsersController < ApplicationController

  def show
    @info = services.get_user
    @posts = services.current_client.posts("#{current_user.name}.tumblr.com", :limit => 20)
    @photos = @posts["posts"][0]["photos"]
  end

end
