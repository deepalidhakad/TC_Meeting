class UsersController < ApplicationController

  skip_before_action :authorized, only: [:new, :create, :update]

    def index
      @users = User.all
    end

    def new   
      @user = User.new
    end

    def create   
      @user = User.create(user_params)   
      session[:user_id] = @user.id   
      WelcomeMailer.with(user: @user).welcome_send.deliver_now
      redirect_to '/welcome'
    end

    def show  
      @user = User.find(params[:id])
    end
  
    def edit
       @user = User.find(params[:id])
    end

    def update
       @user = User.find(params[:id])
      if @user.update(user_params)
         redirect_to users_path
      else
        render :edit
      end
    end

    def destroy
      @user = User.find(params[:id])
      @user.destroy
      flash[:notice] = "Oops Account Delete."
      redirect_to root_path, status: :see_other
    end
   
   private

    def user_params
      params.require(:user).permit(:username, :password, :email, :phone, :address, :image,  :role)
    end

end