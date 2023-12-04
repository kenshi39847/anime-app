class FinishesController < ApplicationController
  def show
    @user = User.find(params[:id])
    @finishes = @user.finishes.order(id: "ASC") 
  end

  def create
    @finish = Finish.new(finish_params)
    if @finish.save
      redirect_to finishes_path
    else
      @finishes = Finish.order(id: "ASC")
      render 'show', status: :unprocessable_entity
    end
  end

  private
  def finish_params
    params.permit(:finish_anime, :group_id).merge(user_id: current_user.id)
  end
end
