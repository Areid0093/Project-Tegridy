class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update]

    def show
        @user = User.find(params[:id])
    end

    def new 
        @user = User.new
    end
    
    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            redirect_to user_path(@user)
        else
            render :edit
        end
    end

    def create 
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :new
        end
    end


    private

    def set_user
        @user = User.find(params[:id])
    end


    def user_params
        params.require(:user).permit(:name, :username, :password, :password_confirmation, :city, :job_title)
    end
    
end
