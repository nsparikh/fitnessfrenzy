class UsersController < ApplicationController
  before_action :signed_in_user, only: [:update, :destroy]
  before_action :correct_user, only: [:update, :destroy]

  def show
    @user = current_user
    @new_tracker = @user.trackers.build
  end

  def new
    if signed_in?
      redirect_to dashboard_path
    else
      @user = User.new
    end
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
      sign_in @user
  		flash[:success] = "Welcome!"
  		redirect_to dashboard_path
  	else
  		render 'new'
  	end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to dashboard_path
    else
      render 'edit'
    end
  end

  def destroy
    current_user.destroy
    flash[:success] = "User deleted"
    redirect_to root_url
  end

  private
  	def user_params
  		params.require(:user).permit(:name, :email, 
  			:password, :password_confirmation)
  	end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(dashboard_path) unless current_user?(@user)
    end

end
