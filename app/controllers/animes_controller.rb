class AnimesController < ApplicationController
  def index
  end

  def new
    @anime = Anime.new
  end

  def create
    Anime.create(anime_params)
    redirect_to root_path
  end

  private
  def anime_params
    params.require(:anime).permit(:title, :synopsis, :genre, :good_point, :recommendation, :text).merge(user_id: current_user.id)
  end
end
