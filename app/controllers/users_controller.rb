class UsersController < ApplicationController
  before_action :authenticate_user!
  
  # ユーザー一覧(管理者のみ利用可)
  def index
    unless current_user.admin == true
      redirect_to posts_path
    end
    @users = User.order(id: :asc).search(params[:search]).page(params[:page]).per(40)
  end

  # ユーザー詳細
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order(created_at: :desc)
    @like_posts = current_user.likes.order(created_at: :desc)
    @comment_posts = current_user.comments.order(created_at: :desc)
  end

  # ユーザー削除(管理者のみ利用可)
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_back(fallback_location: users_path)
  end

  # フォロー一覧
  def following
    @user = User.find(params[:id])
    @users = @user.following.page(params[:page]).per(40).order(created_at: :desc)
  end

  # フォロワー一覧
  def followers
    @user = User.find(params[:id])
    @users = @user.followers.page(params[:page]).per(40).order(created_at: :desc)
  end

  # プロフィール画像削除
  def destroy_image
    current_user.update(image: nil)
    redirect_to edit_user_registration_path
  end
end
