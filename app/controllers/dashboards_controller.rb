class DashboardsController < ApplicationController

  def show
    @post = current_user.posts
  end
end
