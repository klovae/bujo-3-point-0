class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            flash[:success] = "Account created successfully. Welcome to BuJo 3.0!"
            redirect_to days_today_path
        else
            flash[:error] = @user.errors.full_messages
            render :new
        end
    end

    def show
    end

    def edit
    end

    def update
    end

    private

    def user_params
        params.require(:user).permit(:email, :first_name, :last_name, :password, :password_confirmation)
    end
end