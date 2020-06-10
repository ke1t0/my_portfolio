class CommentsController < ApplicationController

  # コメント作成
  def create
    post = Post.find(params[:post_id])
    @comment = post.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      flash[:success] = "コメントしました"
      redirect_back(fallback_location: post_path(post.id))
    else
      flash[:danger] = "コメントに失敗しました"
      redirect_back(fallback_location: post_path(post.id))
    end
  end

  # コメント削除
  def destroy
    post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_back(fallback_location: post_path(post.id))
  end

  private

    def comment_params
      params.require(:comment).permit(:text, :post_id, :user_id)
    end
end
