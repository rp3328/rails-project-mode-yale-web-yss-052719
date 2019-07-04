class UsersController < ApplicationController

    before_action :authorized, only: [:show]


    def new
      @user = User.new
      @pokemons = Pokemon.all
      @types = Type.all
    end
  
    def create
      @user = User.create(user_params)
      @pokemons = Pokemon.all
      @types = Type.all
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

    def poketeam
      @user = User.find(params[:id])
      @poketeam = Pokemon.all[0,5] # @user.recruited_pokemons
    end


    def edit
      @user = User.find(params[:id])
  end

  def update
      @user = User.find(params[:id])
      @user.update(user_params)
      redirect_to user_path(@user)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to "/login"
  end

  def like
    @user = User.find(params[:user_id])
    @pokemon = User.find(params[:pokemon_id])

  end

  def recruit
    @user = User.find(params[:user_id])
    @pokemon = User.find(params[:pokemon_id])
  end


    private
    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation, :full_name, :fav_type, :fav_stat)
    end

end