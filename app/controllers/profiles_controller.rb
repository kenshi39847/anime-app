class ProfilesController < ApplicationController
  def create
    @user = User.find(params[:id])
    @profile = @user.profile.new(profile_params)
    if @profile.save
      return redirect_to user_path(current_user)
    else
      render 'new', status: :unprocessable_entity
    end
  end
  def edit
    
  end 
  def update
  end
  
  private
  def profile_params
    params.require(:profile).permit(:favorite1, :favorite2, :favorite3, :favorite4, :favorite5, :free_comment).merge(user_id: current_user.id)
  end
end
