class DashboardsController < ApplicationController

  def show
    @posts = current_user.posts + current_user.followed_posts
  end
end
