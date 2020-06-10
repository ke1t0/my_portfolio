class RelationshipsController < ApplicationController

  # フォロー
  def create
    @user = User.find(params[:following_id])
    current_user.follow(@user)
  end

  # フォロー解除
  def destroy
    @user = User.find(params[:id])
    current_user.unfollow(@user)
  end
end
