class FollowsController < ApplicationController
  def index
    @followers = current_user.following_users
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
end
