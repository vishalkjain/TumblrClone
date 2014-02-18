class PostsController < ApplicationController
  before_filter :require_correct_user!, :only => [:edit, :update, :destroy]
  def new
  end

  def create
    @post = Post.new(params[:post])
    @post.user_id = current_user.id

    if(params[:tag][:name] != "")
      @post.tags.new(params[:tag])
    end
    if @post.save
      redirect_to dashboard_url
    else
      render :json => @post.errors.full_messages
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

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      redirect_to dashboard_url
    else
      render :json => @post.errors.full_messages
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to dashboard_url
  end

  def require_correct_user!
    if current_user != Post.find(params[:id]).user
      redirect_to dashboard_url
    end
  end
end
