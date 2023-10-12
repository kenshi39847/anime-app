class AnimesController < ApplicationController
  def index
  end

  def new
    @anime = Anime.new
  end

  def create
    Anime.create(anime_params)
    redirect_to '/'
  end

  private
  def anime_params
    params.require(:anime).permit(:title, :synopsis, :genre_id, :good_point_id, :recommendation_id, :text).merge(user_id: current_user.id)
  end
end
