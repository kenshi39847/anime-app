class NetabaresController < ApplicationController
  before_action :authenticate_user!

  def change_count
    @anime = Anime.find(params[:anime_id])
    netabare = current_user.netabares.find_by(anime_id: @anime.id)
    if netabare.present?
      netabare.destroy
      redirect_to anime_path(netabare.anime.id)
    else
      @netabare = current_user.netabares.build(anime_id: params[:anime_id])
      @netabare.save
      redirect_to anime_path(@netabare.anime.id)
    end
  end

end
