class UsersController < ApplicationController
    skip_around_action :set_time_zone, only: [:new, :create]
    skip_around_action :set_time_zone unless :current_user
    skip_before_action :auth_required, only: [:new, :create]

    def new
        if current_user
            set_time_zone {@today = current_user.days.find_or_create_by(date: Time.zone.today.beginning_of_day)}
            redirect_to day_path(@today)
        else
            @user = User.new
        end
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            set_time_zone { @today = Day.today(@user.id) }
            flash[:success] = "Account created successfully. Welcome to BuJo 3.0!"
            redirect_to day_path(@today)
        else
            flash.now[:errors] = @user.errors.full_messages
            render :new
        end
    end

    def show
        @user = current_user
    end

    def edit
    end

    def update
    end    

    private

    def user_params
        params.require(:user).permit(:email, :first_name, :last_name, :time_zone, :password, :password_confirmation)
    end

    
end