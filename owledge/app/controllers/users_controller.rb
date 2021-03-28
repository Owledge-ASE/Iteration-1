class UsersController < ApplicationController

  def show
    id = params[:id]
    if current_user.nil? and id.nil?
      flash[:error] = "Login required to view your profile."
      session["user_return_to"] = current_user_profile_path
      redirect_to login_path and return
    elsif id.nil?
      @user = current_user
      return
    end

    flash[:error] = nil
    begin
      @user = User.find(id)
    rescue ActiveRecord::RecordNotFound => e
      flash[:error] = "Could not find a profile with ID #{id}"
      redirect_to '/' and return
    end
  end
end
