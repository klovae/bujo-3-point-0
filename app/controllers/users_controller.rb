class UsersController < ApplicationController
    #skip_around_action :set_time_zone, only: [:new, :create]

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            flash[:success] = "Account created successfully. Welcome to BuJo 3.0!"
            @today = @user.days.find_or_create_by(date: Time.zone.today.beginning_of_day)
            redirect_to day_path(@today)
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