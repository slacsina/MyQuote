class ApplicationController < ActionController::Base

    helper_method :current_user, :logged_in?, :is_administrator? #allows methods to be used by views

    def current_user #sets current user based on login
        @current_user ||= User.find_by(id: session[:user_id])
    end

    def logged_in? #checks if user is logged in
        !current_user.nil?
    end

    def is_administrator? #checks if current user is an admin
        session[:is_admin]
    end      

private

    def require_login #ensures user is logged in to perform certain action
        unless logged_in?
        flash[:error] = "You are not permitted to access this resource"
        redirect_to login_path
        end
    end

end