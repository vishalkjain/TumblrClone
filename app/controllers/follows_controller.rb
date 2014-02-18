class FollowsController < ApplicationController
  def index
    @followers = current_user.following_users
    #@followed_users = current_user.followed_users
  end

  def create
    @user = User.find_by_username(params[:follow][:follow_name])
    if @user
      @follow = Follow.new({user_id: current_user.id, follow_id: @user.id})
      @follow.save
      redirect_to dashboard_url
    else
      render :json => "Username doesn't exist"
    end
  end

  def destroy
    @follow = Follow.find_by_user_id_and_follow_id(params[:user_id], params[:id])
    @follow.destroy
    redirect_to :back
  end
end
