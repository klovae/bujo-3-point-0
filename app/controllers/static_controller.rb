class StaticController < ApplicationController
    around_action :set_time_zone, if: :current_user
    skip_before_action :auth_required

    def help
    end

    def about
    end

    def index
    end

end