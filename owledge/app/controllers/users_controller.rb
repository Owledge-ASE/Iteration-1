class UsersController < ApplicationController
  def show
      flash[:error] = nil
      id = params[:id]
      begin
        @user = User.find(params[:id])
      rescue ActiveRecord::RecordNotFound => e
        flash[:error] = "Could not find a note with ID #{id}"
        redirect_to 'index' and return
      end
    end
end
