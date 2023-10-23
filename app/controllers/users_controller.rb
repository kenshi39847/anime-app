class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @animes = @user.animes
    @netabare = {}
    @animes.each do |anime|
      @netabare[anime.id] = Netabare.where(anime_id: anime.id).count
    end
  end
end
