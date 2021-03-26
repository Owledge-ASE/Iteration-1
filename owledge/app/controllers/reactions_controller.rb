class ReactionsController < ApplicationController
  before_action :authenticate_user!

  def new
  @user = current_user
  if flash.key?(:like)
   @reaction = flash[:like]
    else
      @reaction = UserReaction.new
    end
  end

  def create
    #@user = current_user
    #current_user.id = params[:like][:user_id]
    @reaction = UserReaction.new(allowed_params)

    if @reaction.valid?
      if @reaction.save
        flash[:success] = "Reaction counted!"
        redirect_to notebook_path @reaction.note_id and return
      end
    end
    flash[:error] = "Could not save reaction."
    @user = current_user
    render action: "new"
    #render action: "new"
  end

  def destroy
    #@reaction = current_user.like.find(param[:user_id])
    @reaction = UserReaction.where(user_id: current_user.id, note_id: params[:note_id]).exists?
    if @reaction
      @reaction.destroy
    end
  end

  def count
    #@user = current_user
    note_id = params[:notebook_id]
    #reaction_id = params[:id]
    count = UserReaction.where(note_id: note_id).count
  end

  def index
    redirect_to notebook_path params[:notebook_id]
  end

  def show
    redirect_to notebook_path params[:notebook_id]
  end

  protected
  def reaction_params
    params.require(:like).permit(:user_id, :note_id, :like)
  end
end

  #private
  #def find_note
  #  @note = Note.find(params[:note_id])
  #end
  #end

