class PlofilesController < ApplicationController
  def create
    @user = User.find(params[:id])
    @plofile = @user.plofile.new(plofile_params)
  end
  def edit

  end 

  private
  def plofile_params
    params.require(:plofile).permit(:favorite1, :favorite2, :favorite3, :favorite4, :favorite5, :free_comment).merge(user_id: current_user.id)
  end
end