class ApplicationController < ActionController::Base
    add_flash_types :error
    add_flash_types :success
    helper_method :current_user
    around_action :set_time_zone

    def current_user
        User.find_by_id(session[:user_id])
    end

    def set_time_zone
        Time.use_zone(current_user.time_zone) { yield }
    end

end
