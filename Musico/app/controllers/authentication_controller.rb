class AuthenticationController < ApplicationController
  def login
     
  end

  def logout
    session[:user_id] =nil
  end

  def validate
    email = params[:email]
    password = params[:password] 
    @user = User.find_by_email(email)
    if(@user != nil)
      if(@user.password == password)
        session[:user_id] = @user.id
        redirect_to root_path
      else 
        puts "password not matched"
        render :login
      end
    else
      puts "user not exist"
      render :login
    end  
  end

end
