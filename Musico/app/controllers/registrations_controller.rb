class RegistrationsController < ApplicationController
  skip_before_action :check_login

  def new
    
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to user_url(@user), notice: "User was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private
  def user_params
    params.permit(:name, :email, :password, :dob)
  end
end
