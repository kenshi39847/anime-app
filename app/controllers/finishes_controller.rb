class FinishesController < ApplicationController
  def index
    # @finishes = Finish.where(user_id: params[:user_id]).order(id: "DESC") 
    @finishes = Finish.order(id: "DESC")
  end

  def create
    @finish = Finish.new(finish_params)
    if @finish.save
      redirect_to finishes_path
    else
      @finishes = Finish.order(id: "DESC")
      render 'index', status: :unprocessable_entity
    end
  end

  private
  def finish_params
    params.permit(:finish_anime, :group_id).merge(user_id: current_user.id)
  end
end
