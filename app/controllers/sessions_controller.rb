class SessionsController < ApplicationController

    def new #displays login page
    end

    def create #handles login process
      user = User.find_by(email: params[:email])
      if user && user.authenticate(params[:password]) && user.status == "Active"
        session[:user_id] = user.id
        session[:fname] = user.fname
        session[:surname] = user.surname
        session[:is_admin] = user.is_admin
        if session[:is_admin]
          redirect_to admin_path, notice: "Logged in successfully!"
        else
          redirect_to userhome_path, notice: "Logged in successfully!"
        end
      else
        flash.now[:error] = "Invalid email or password. Please try again."
        render 'new'
      end
    end

    def destroy #handles logout process
      session[:user_id] = nil
      redirect_to root_path, notice: "Logged out successfully!"
    end
end