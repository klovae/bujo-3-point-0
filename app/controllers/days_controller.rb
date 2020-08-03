class DaysController < ApplicationController

    def index
        @days = current_user.days.all
    end

    def show
        @day = Day.find_by_id(params[:id])
        unless current_user && @day.user == current_user
          flash[:error] = "You must be logged in as a different user to view that task list"
          redirect_to login_path
        end
    end

end