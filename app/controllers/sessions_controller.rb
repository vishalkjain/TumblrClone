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
    end

    if @user
      sign_in(@user)
      redirect_to dashboard_url
    else
      render :json => "Credentials were wrong"
    end
  end

  def destroy
    sign_out
    redirect_to new_session_url
  end
end
