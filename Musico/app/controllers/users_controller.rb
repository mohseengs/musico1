class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  def index
    @users = User.where.not(id: current_user.id)
  end

  # GET /users/1 or /users/1.json
  def show
  end


  # GET /users/1/edit
  def edit
  end


  # PATCH/PUT /users/1 or /users/1.json
  def update
      if @user.update(user_params)
        redirect_to user_url(@user), notice: "User was successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
      @user.destroy!
      session[:user_id] = nil
      redirect_to login_path, notice: "User was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
      if(@user != current_user) 
        render status: 400
      end
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :dob)
    end
end
