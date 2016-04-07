class SessionsController < ApplicationController
  def home
    if current_user
      redirect_to profiles_path
    else
      render template: 'home', layout: false
    end
  end
  
  def new
    if current_user
      redirect_to profile_path(current_user.profile)
    else
      render template: 'users/login'
    end
  end

  def create
    @user = User.find_by(username: login_params[:username])
    if @user && @user.authenticate(login_params[:password])
      session[:user_id] = @user.id
      redirect_to profiles_path
    else
      @errors = ['wrong credentials']
      render template: 'users/login'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_url
  end

  private
  def login_params
    params.require(:user).permit(:username, :password)
  end
end
