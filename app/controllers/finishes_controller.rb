class FinishesController < ApplicationController
  def index
    @finishes = Finish.order(id: "DESC")
  end

  def create
    @finish = Finish.create(finish_params)
    if @finish.save
      return redirect_to finishes_path
    else
      render 'index'
    end
  end

  private
  def finish_params
    params.permit(:finish_anime, :group_id).merge(user_id: current_user.id)
  end
end
