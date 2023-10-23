class CommentsController < ApplicationController
  def create
    @anime = Anime.find(params[:anime_id])
    @comment = @anime.comments.new(comment_params)
    @comment.user_id = current_user.id
    @comment_reply = @anime.comments.new
    if @comment.save
      redirect_to anime_path(@comment.anime.id)
    else
      redirect_to anime_path(@anime)
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :parent_id).merge(user_id: current_user.id, anime_id: params[:anime_id])
  end
end
