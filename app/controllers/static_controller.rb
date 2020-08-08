class StaticController < ApplicationController
    skip_around_action :set_time_zone unless :current_user

    def help
    end

    def about
    end

    def index
        if current_user
            redirect_to day_path(Day.today(current_user.id))
        end
    end

end