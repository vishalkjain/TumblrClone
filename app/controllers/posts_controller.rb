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

  def show
    @post = Post.find(params[:id])
    # if @post
#       redirect_to post_url(@post)
#     else
#       render :json => "Post does not exist"
#     end
  end
end
