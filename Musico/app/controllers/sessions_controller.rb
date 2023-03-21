class SessionsController < ApplicationController
  skip_before_action :check_login

  def new
     
  end

  def create
    email = params[:email]
    password = params[:password] 
    @user = User.find_by_email(email)
    if(@user && @user.password == password)
        session[:user_id] = @user.id
        redirect_to root_path
    else 
        redirect_to login_path, notice: "wrong email or password"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end

end
