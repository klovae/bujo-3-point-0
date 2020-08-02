class SessionsController < ApplicationController

    def new
    end

    def create
    end

    private

    def sessions_params
        params.permit(:email, :password)
    end
end