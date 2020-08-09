class StaticController < ApplicationController
    skip_around_action :set_time_zone unless :current_user
    skip_before_action :auth_required

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