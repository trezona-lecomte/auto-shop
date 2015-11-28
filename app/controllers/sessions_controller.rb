class SessionsController < ApplicationController
  def create
    service = FindOrCreateUserFromOauth.new(request.env["omniauth.auth"])

    if service.call
      @user = service.user
      session[:user_id] = @user.id
      flash[:success] = "Welcome, #{@user.name}"
    else
      flash[:warning] = "Sorry, there was a problem: #{service.errors.messages}"
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

  def oauth_failure
    flash[:warning] = "Sorry, there was a problem: #{params[:message]}"
    redirect_to root_path
  end
end
