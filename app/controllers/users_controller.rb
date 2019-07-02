class UsersController < ApplicationController

    before_action :authorized, only: [:show]

    def new
      @user = User.new
    end
  
    def create
      @user = User.create(user_params)
  
      if @user.valid?
        session[:user_id] = @user.id # Logs me in after signing up
        redirect_to user_path(@user)
      else
        flash[:error] = @user.errors.full_messages
        render 'new'
      end
    end
  
    def show

      @user = User.find(params[:id])
    end
  
    private
    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation, :full_name, :fav_type, :fav_stat)
    end

end