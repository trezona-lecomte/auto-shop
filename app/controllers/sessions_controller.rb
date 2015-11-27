class SessionsController < ApplicationController
  def create
    begin
      @user = User.from_omniauth!(request.env["omniauth.auth"])
      session[:user_id] = @user.id

      flash[:success] = "Welcome, #{@user.name}"
    rescue
      flash[:warning] = "We ran into a problem while trying to authenticate you"
    end

    redirect_to root_path
  end

  def destroy
    if current_user
      session.delete(:user_id)

      flash[:success] = "See you again soon!"
    end

    redirect_to root_path
  end
end
