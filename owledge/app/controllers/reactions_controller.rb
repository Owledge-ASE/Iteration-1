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

  #def create
  # @reaction = UserReaction.new(allowed_params)

  # if @reaction.valid?
  #  if @reaction.save
  #    flash[:success] = "Reaction counted!"
  #   redirect_to notebook_path @reaction.note_id and return
  # end
  # end
  # flash[:error] = "Could not save reaction."
  # @user = current_user
  #render action: "new"
    #render action: "new"
  #end

  def create
    #note = Note.find_by(params[:note_id])
    @reaction = UserReaction.where(user_id: current_user, note_id: params[:note_id])
    if @reaction = UserReaction.find_by(note_id: params[:node_id], user_id: current_user.id)
      @reaction.destroy
    else
      @reaction = UserReaction.new(note_id: params[:node_id], user_id: current_user.id)
      @reaction.save
    end
    redirect_to notebook_path
  end

  def destroy
    #@reaction = current_user.like.find(param[:user_id])
    @reaction = UserReaction.where(user_id: current_user.id, note_id: params[:note_id]).exists?
    if @reaction
      @reaction.destroy
    end
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

