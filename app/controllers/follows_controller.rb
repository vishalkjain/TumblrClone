class FollowsController < ApplicationController
  def index
    @followers = current_user.following_users
  end

end
