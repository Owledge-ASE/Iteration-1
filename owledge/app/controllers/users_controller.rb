class UsersController < ApplicationController
  def show
    id = params[:id]
    if current_user.nil? and id.nil?
      redirect_to 'index' and return
    elsif id.nil?
      @user = current_user
      return
    end

    flash[:error] = nil
    begin
      @user = User.find(id)
    rescue ActiveRecord::RecordNotFound => e
      flash[:error] = "Could not find a note with ID #{id}"
      redirect_to 'index' and return
    end
  end
end
