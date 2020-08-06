class StaticController < ApplicationController
    skip_around_action :set_time_zone

    def help
    end

    def about
    end

    def index
    end

end