class SessionsController < ApplicationController
  before_filter :require_signed_out!, :only => [:new, :create]
  before_filter :require_signed_in!, :only => [:destroy]

  def new
  end

  def create
    if request.env['omniauth.auth']
      fb_data = request.env['omniauth.auth']
      @user = User.find_by_uid(fb_data[:uid])
      unless @user
        @user = User.create_from_fb_data(fb_data)
      end
    else
      @user = User.find_by_credentials(params[:user][:email],
        params[:user][:password])
        if @user && @user.email == "demo@example.com"
          resetDemoAccount(@user)
        end
    end

    if @user
      sign_in(@user)
      redirect_to dashboard_url
    else
      flash[:errors] = ["Invalid email/password combination"]
      render action: "new"
    end
  end

  def destroy
    sign_out
    redirect_to new_session_url
  end

  def resetDemoAccount(user)
    user.posts.destroy_all
    user.follows.destroy_all
    user.followers.destroy_all
    user.username = "DemoUser"
    u = User.find_by_email("demo1@example.com")
    u2 = User.find_by_email("demo2@example.com")
    u3 = User.find_by_email("demo3@example.com")
    Post.create!(user_id: 6, title: "Edit Me!", body: "<div>Use the Rich Text Editor to format the words below</div>Bold Italics Strike Underline<div><br></div><div>Left</div><div>Center</div><div>Right</div>")
    Follow.create(user_id: user.id, follow_id: u.id)
    Follow.create(user_id: user.id, follow_id: u2.id)
    Follow.create(user_id: user.id, follow_id: u3.id)
  end

end
