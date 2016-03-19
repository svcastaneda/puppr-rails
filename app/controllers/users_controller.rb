class UsersController < ApplicationController
  def index
    @sitters = User.where(sitter: true).where.not(id: current_user.id).order(updated_at: :desc)
  end

  def new
    if current_user
      redirect_to edit_user_path(current_user)
    else
      @user = User.new
      render template: 'users/edit'
    end
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to users_path
    else
      @errors = @user.errors.full_messages
      render template: 'users/edit'
    end
  end

  def show
    if current_user
      @user = User.find_by(id: params[:id])
      if @user.nil? # change to 404
        redirect_to root_path
      end
    else
      redirect_to login_path
    end
  end

  def edit
    current_user ? (@user = current_user) : (redirect_to login_path)
  end

  def update
    @user = current_user
    if @user.update_attributes(user_params)
      redirect_to user_path(@user)
    else
      p @errors = @user.errors.full_messages
      render template: 'users/edit'
    end
  end

  def destroy
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :username, :password, :password_confirmation, :birthday, :price, :xp_years, :housing_type, :bio, :sitter, :address, :city, :state, :country, :zip_code)
  end

end
