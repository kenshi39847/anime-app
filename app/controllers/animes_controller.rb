class AnimesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
    @animes = Anime.all
  end

  def new
    @anime = Anime.new
  end

  def create
    @anime = Anime.new(anime_params)
    if @anime.save
      return redirect_to root_path
    else
      render 'new', status: :unprocessable_entity
    end
  end

  private
  def anime_params
    params.require(:anime).permit(:title, :synopsis, :genre_id, :good_point_id, :recommendation_id, :text, :image).merge(user_id: current_user.id)
  end
end
