class DaysController < ApplicationController

    def index
        @days = current_user.days.all
    end

    def show
        @day = Day.find_by_id(params[:id])
        @migrations = Migration.migrated_tasks(@day.id)
        unless current_user && @day.user == current_user
          flash[:error] = "Invalid day."
          redirect_to root_path
        end
    end

end