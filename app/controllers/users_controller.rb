class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @animes = @user.animes.order(created_at: :desc)
    @netabare = {}
    @animes.each do |anime|
      @netabare[anime.id] = Netabare.where(anime_id: anime.id).count
    end
    @profile = @user.profile
  end
=begin 
    @currentUserEntry=Entry.where(user_id: current_user.id)  #現在ログインしているユーザー
    @userEntry=Entry.where(user_id: @user.id)  #もう一人のユーザー
    if @user.id == current_user.id  #もう一人のユーザー=現在ログインしているユーザー
    else                            #ではない
      @currentUserEntry.each do |cu|  #ルームが既に作成されている場合
        @userEntry.each do |u|
          if cu.room_id == u.room_id then
            @isRoom = true
            @roomId = cu.room_id
          end
        end
      end
      if @isRoom  #ルームが既に作られている状態
      else        #ではない
        @room = Room.new
        @entry = Entry.new
      end
    end
=end

end
