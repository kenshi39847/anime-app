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

  def edit
    @anime = Anime.find(params[:id])
  end

  def update
    @anime = Anime.find(params[:id])
     if @anime.update(anime_params)
      redirect_to root_path
     else
      render :edit, status: :unprocessable_entity
     end
  end

  def destroy
    anime = Anime.find(params[:id])
    anime.destroy
    redirect_to root_path
  end

  private
  def anime_params
    params.require(:anime).permit(:title, :synopsis, :genre_id, :good_point_id, :recommendation_id, :text, :image).merge(user_id: current_user.id)
  end

end
