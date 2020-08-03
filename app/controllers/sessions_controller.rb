class SessionsController < ApplicationController

    def new
    end

    def create
        @user = User.find_by(email: params[:email])
        if @user && @user.authenticate(params[:password])
            
            session[:user_id] = @user.id
            flash[:success] = "Welcome back, #{current_user.first_name}!"
            redirect_to user_path(@user)
        else
            flash[:error] = "Sorry, your username and/or password is incorrect. Please try again."
            render :new
        end
    end

    def destroy
        reset_session
        redirect_to login_path
    end
end