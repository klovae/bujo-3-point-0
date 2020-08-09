class ApplicationController < ActionController::Base
    add_flash_types :error
    add_flash_types :success
    helper_method :current_user
    around_action :set_time_zone
    before_action :auth_required

    def current_user
        User.find_by_id(session[:user_id])
    end

    def auth_required
        unless current_user
            redirect_to login_path
        end
    end

    def set_time_zone
        if current_user
            Time.use_zone(current_user.time_zone) { yield }
        end
    end

end
