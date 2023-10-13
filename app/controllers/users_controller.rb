class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @animes = @user.animes
  end
end
