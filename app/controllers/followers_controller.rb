class FollowersController < ApplicationController
  def index
    @followers = services.get_followers
  end

end
