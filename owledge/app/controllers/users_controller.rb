class UsersController < ApplicationController
  def show
    if current_user.nil? and !params.key?(:id)
      redirect_to 'index' and return
    elsif id.nil?
      @user = current_user
      return
    end
    id = params[:id]

    flash[:error] = nil
    begin
      @user = User.find(id)
    rescue ActiveRecord::RecordNotFound => e
      flash[:error] = "Could not find a note with ID #{id}"
      redirect_to 'index' and return
    end
  end
end
