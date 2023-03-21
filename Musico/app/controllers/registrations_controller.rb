class RegistrationsController < ApplicationController
  skip_before_action :check_login

  def new
    
  end

  def create
    @user = User.new(user_params)
      if @user.save
         redirect_to user_url(@user), notice: "User was successfully created." 
      else
       render :new, status: :unprocessable_entity 
      end
  end

  private
  def user_params
    params.permit(:name, :email,  :password, :password_confirmation, :dob)
  end
end
