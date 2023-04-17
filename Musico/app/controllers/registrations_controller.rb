class RegistrationsController < ApplicationController
  skip_before_action :check_login

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
      if @user.save
        redirect_to login_path, notice: "User was successfully created."
      else
        render :new, status: :unprocessable_entity 
      end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :dob , :profile_picture)
  end
end
