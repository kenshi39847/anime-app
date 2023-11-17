class ProfilesController < ApplicationController
  def new
    @profile = Profile.new
    if Profile.find_by(user_id: current_user.id)
      redirect_to root_path
    end
  end
  
  def create
    @profile = Profile.new(profile_params)
    if @profile.save
      return redirect_to user_path(@profile.user.id)
    end
    else
      render :new
    end
  end

  def edit
    # ログイン中のユーザーと編集するユーザーが一致しないとページに遷移できないようにする
    unless current_user.id == @profile.user.id
      redirect_to user_path(@profile.user.id)
    end
  end 

  def update
    # createと同じように更新できたらユーザー詳細に戻るため引数をわたす
    if @intro.update(profile_params)
      redirect_to user_path(@profile.user.id)
    else
      render :edit
    end
  end
  
  private
  def profile_params
    params.require(:profile).permit(:favorite1, :favorite2, :favorite3, :favorite4, :favorite5, :free_comment).merge(user_id: current_user.id)
  end
end
