class PostsController < ApplicationController
  def new
  end

  def create
    @post = Post.new(params[:post])
    @post.user_id = current_user.id

    if @post.save
      redirect_to dashboard_url
    else
      render :json => @user.errors.full_messages
    end
  end
end
