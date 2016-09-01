class LikesController < ApplicationController
  def index
    @likes = services.get_likes
  end

end
