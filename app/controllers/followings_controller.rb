class FollowingsController < ApplicationController
  def index
    @followed_users = current_user.followed_users
  end
end
