class AuthenticationController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]
  layout "authentication"

  def signup
    @user = User.new(user_params)

  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to user_url(@user), notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

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

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.permit(:name, :email, :password, :dob)
  end

end
