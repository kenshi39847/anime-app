class NetabaresController < ApplicationController
  before_action :authenticate_user!

  def create
    @anime = Anime.find(params[:anime_id])
    
    if user_signed_in?
      if params[:operation] == 'increment'
        @anime.increment_netabare_count
      elsif params[:operation] == 'decrement'
        @anime.decrement_netabare_count
      end
    end

    redirect_to @anime, notice: 'ネタバレカウントが更新されました。'
  end
end
