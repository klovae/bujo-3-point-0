class ApplicationController < ActionController::Base
    add_flash_types :error
    add_flash_types :success
    helper_method :current_user

    def current_user
        User.find_by_id(session[:user_id])
    end

end
