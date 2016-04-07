class ProfilesController < ApplicationController
  def index
    @sitters = Profile.where(sitter: true)#.where.not(id: current_user.id).order(updated_at: :desc)
  end

  # def new
  #   if current_user
  #     redirect_to edit_user_path(current_user)
  #   else
  #     @user = User.new
  #     render template: 'users/edit'
  #   end
  # end
  #
  # def create
  #   @user = User.new(user_params)
  #
  #   if @user.save
  #     session[:user_id] = @user.id
  #     Profile.create(user: @user)
  #     redirect_to edit_profile_path(@user.profile)
  #   else
  #     @errors = @user.errors.full_messages
  #     render template: 'users/edit'
  #   end
  # end

  def show
    if current_user
      @profile = Profile.find_by(id: params[:id])
      if @profile.nil? # change to 404
        redirect_to root_path
      end
    else
      redirect_to login_path
    end
  end

  def edit
    current_user ? (@profile = current_user.profile) : (redirect_to login_path)
  end

  def update
    @profile = current_user.profile
    if @profile.update_attributes(profile_params)
      redirect_to profile_path(@profile)
    else
      p @errors = @profile.errors.full_messages
      render template: 'users/edit'
    end
  end

  def destroy
  end

  private
  def profile_params
    params.require(:profile).permit(:sitter, :housing_type, :price, :xp_years, :bio, :address_line_1, :address_line_2, :city, :state, :country, :zip_code)
  end

end
