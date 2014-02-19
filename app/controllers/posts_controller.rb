class PostsController < ApplicationController
  before_filter :require_correct_user!, :only => [:edit, :update, :destroy]
  def new
  end

  def create
    @post = Post.new(params[:post])
    @post.user_id = current_user.id

    if params[:tag][:tag_name].length > 0
     params[:tag][:tag_name].split(" ").each do |tagname|
       @post.tags << Tag.find_or_create_by_tag_name(tagname)
       # tag = Tag.find_by_tag_name(tagname)
#        if tag
#          @post.taggings.new(tag_id: tag.id)
#        else
#          @post.tags.new(tag_name: tagname)
#        end
     end
    end

    #@post.tags.new(params[:tag])
    if @post.save
      redirect_to dashboard_url
    else
      render :json => @post.errors.full_messages
    end
    # github: gameboyvj
#     site to see my repositories is just: https://github.com/gameboyvj?tab=repositories
#     best projects are Chess, Asteroids because they are complete with graphics
#     most of the other projects were practice backend work
#     my final project right now is a Tumblr clone
#     replicates the ability to CRUD (stands for create, read, update and delete)
#     I CRUD posts, followers and tags
#     posts = ability to make new blog post
#     followers = ability for blog to follow and be followed
#     tags = tag a post to organize topics (can click on tag to see all other posts in world that have same tag)
#
#     if u wanna try out asteroids, go to asteroids repo, click "download zip" on right bar, extract zip, and double click on index.html
#       it should open in browser, use arrow keys to move and spacebar to shoot
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
          @post.taggings.new({tag_id: tag.id})
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
