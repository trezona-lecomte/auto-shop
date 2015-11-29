class UsersController < ApplicationController
  def show
    unauthenticated and return unless current_user
    unauthorized unless current_user.id == params[:id].to_i

    @user = User.find(current_user.id)
  end

  private

  def unauthenticated
    flash[:error] = "Please sign in first."
    redirect_to root_path
  end

  def unauthorized
    flash[:error] = "Sorry, you're not authorized to do that."
    redirect_to root_path
  end
end
