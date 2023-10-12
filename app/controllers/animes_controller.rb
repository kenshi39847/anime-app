class AnimesController < ApplicationController
  def index
  end

  def new
    @anime = Anime.new
  end
end
