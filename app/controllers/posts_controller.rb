class PostsController < ApplicationController
  before_filter :require_correct_user!, :only => [:edit, :update, :destroy]
  def new
  end

  def create
    @post = Post.new(params[:post])
    @post.user_id = current_user.id
    if params[:post][:post_photo]
      @post.photo_url = true
    end
    if params[:tag][:tag_name].length > 0
      params[:tag][:tag_name].split(" ").each do |tagname|
        @post.tags << Tag.find_or_create_by_tag_name(tagname)
      end
    end
    if !@post.save
      render :json => @post.errors.full_messages
    else
      if request.xhr?
        render partial: "posts/post", locals: {post: @post}
      else
        redirect_to dashboard_url
      end

    end

    # if request.xhr?
 #      render partial: "post/post", locals: {post: @post}
 #    if @post.save
 #      redirect_to dashboard_url
 #    else
 #      render :json => @post.errors.full_messages
 #    end
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
    if(params[:tag][:tag_name] != "")
      params[:tag][:tag_name].split(" ").each do |tagname|
        tag = Tag.find_by_tag_name(tagname)
        if tag
          unless @post.tags.include?(tag)
            @post.taggings.new({tag_id: tag.id})
          end
        else
          @post.tags.new({tag_name: tagname})
        end
      end
    end
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
