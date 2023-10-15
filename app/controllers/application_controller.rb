class ApplicationController < ActionController::Base
    before_action :require_login

    def require_login
        unless current_user
            redirect_to root_path, notice:"You must login to Access this website"
        end
    end

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
    helper_method :current_user
end
