class HomesController < ApplicationController

  def show
    if current_user != nil
    @dashboard = services.current_client.dashboard
    @posts = Kaminari.paginate_array(@dashboard["posts"]).page(params[:page]).per(20)
    end
  end


end
