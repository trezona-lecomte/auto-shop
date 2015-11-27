class SessionsController < ApplicationController
  def create
    service = FindOrCreateUserFromOauth.new(request.env["omniauth.auth"])

    if service.call
      @user = service.user
      session[:user_id] = @user.id
      flash[:success] = "Welcome, #{@user.name}"
    else
      flash[:warning] = "We ran into a problem while trying to authenticate you: \n"
                      + "#{service.errors.full_messages}"
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
