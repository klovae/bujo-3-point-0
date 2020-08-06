class SessionsController < ApplicationController
    skip_around_action :set_time_zone

    def new
    end

    def create
        @user = User.find_by(email: params[:email])
        if @user && @user.authenticate(params[:password])
            
            session[:user_id] = @user.id
            set_time_zone {@today = @user.days.find_or_create_by(date: Time.zone.today.beginning_of_day)}
            flash[:success] = "Welcome back, #{current_user.first_name}!"
            redirect_to day_path(@today)
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