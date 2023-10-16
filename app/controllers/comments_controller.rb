class CommentsController < ApplicationController
  def create
    comment = Comment.create(comment_params)
    redirect_to anime_path(comment.anime.id)
  end

  private
  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, anime_id: params[:anime_id])
  end
end
