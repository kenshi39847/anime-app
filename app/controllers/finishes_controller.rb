class FinishesController < ApplicationController
  def index
    @finishes = Finish.order(id: "DESC")
  end

  def create
    binding.pry
    Finish.create(finish_params)
    redirect_to action: :index
  end

  private
  def finish_params
    params.require(:finish).permit(:finish_anime, :group_id).merge(user_id: current_user.id)
  end
end
