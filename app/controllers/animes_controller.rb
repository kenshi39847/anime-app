class AnimesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :redirect_to_index, only: [:edit, :update, :destroy]
  def index
    @animes = Anime.all.order(created_at: :desc)
    @q = Anime.ransack(params[:q])
    @q.combinator = 'or'
    animes = @q.result(distinct: true)
    @netabare = {}
    @animes.each do |anime|
      @netabare[anime.id] = Netabare.where(anime_id: anime.id).count
    end
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
    session[:previous_url] = request.referer
  end

  def update
    @anime = Anime.find(params[:id])
     if @anime.update(anime_params)
      @anime.update(edited: true)
      redirect_to session[:previous_url]
     else
      render :edit, status: :unprocessable_entity
     end
  end

  def destroy
    anime = Anime.find(params[:id])
    anime.destroy
    redirect_to user_path(anime.user)
  end

  def show
    @anime = Anime.find(params[:id])
    @comments = @anime.comments
    @comment = Comment.new
    @comment_reply = @anime.comments.new
    @netabares = Netabare.where(anime_id: @anime.id)
    @netabare = Netabare.new
  end

  def search
    @q = Anime.ransack(params[:q])
    @q.combinator = 'or'
    @animes = @q.result(distinct: true).order(created_at: :desc)
    @netabare = {}
    @animes.each do |anime|
      @netabare[anime.id] = Netabare.where(anime_id: anime.id).count
    end
  end

  private
  def anime_params
    params.require(:anime).permit(:title, :synopsis, :genre_id, :good_point_id, :recommendation_id, :text, :image).merge(user_id: current_user.id)
  end

  def redirect_to_index
    @anime = Anime.find(params[:id])
    return redirect_to root_path if current_user.id != @anime.user.id 
  end
end
