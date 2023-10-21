class NetabaresController < ApplicationController
  before_action :authenticate_user!

  def change_count
    @anime = Anime.find(params[:anime_id])
    @netabare = current_user.netabares.build(anime_id: params[:anime_id])
    @netabare.save
  end

end
