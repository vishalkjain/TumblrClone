class TagsController < ApplicationController
  def new
  end

  def create
    @tag = Tag.new(params[:tag])
    if @tag.save
    else
      render :json => @tag.errors.full_messages
    end
  end

  def show
    @tag = Tag.find(params[:id])
    @tagged_posts = @tag.tagged_posts

  end
end
