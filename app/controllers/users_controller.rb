class UsersController < ApplicationController
  before_filter :require_signed_in!, :only => [:show]
  before_filter :require_signed_out!, :only => [:create, :new]
  layout "sessions", :only => [:new]
  def new
    @user = User.new
  end

  def create

    @user = User.new(params[:user])

    if @user.save
      AuthMailer.signup_email(@user).deliver!
      sign_in(@user)
      redirect_to dashboard_url
    else
      render :json => @user.errors.full_messages
    end
  end

  def show

    @user = User.find(params[:id])
    unless current_user.followed_users.include?(@user)
      @potential_follow = @user
    end
    @posts = @user.posts
    # if params.include?(:id)
#       @user = User.find(params[:id])
#     else
#       redirect_to user_url(current_user)
#     end
  end

  def edit
    @user = current_user
  end

  def update
    #@user = current_user
    if current_user.update_attributes(params[:user])
      redirect_to dashboard_url
    else
      render :json => current_user.errors.full_messages
    end
  end
end