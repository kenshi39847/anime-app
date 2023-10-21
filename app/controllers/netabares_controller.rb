class NetabaresController < ApplicationController
  before_action :authenticate_user!

  def increment
    @anime = Anime.find(params[:anime_id])
    @netabare = @anime.netabare || @anime.build_netabare(user: current_user)
    @netabare.increment!(:count, 1)
    @netabare.save
    redirect_to anime_path(@anime)
  end

  def decrement
    @anime = Anime.find(params[:anime_id])
    @netabare = @anime.netabare || @anime.build_netabare(user: current_user)
    @netabare.decrement!(:count, 1)
    @netabare.save
    redirect_to anime_path(@anime)
  end
end
