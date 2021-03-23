class CommentsController < ApplicationController
  before_action :authenticate_user!
  def new
    @user = current_user
    if flash.key?(:comment)
      @comment = flash[:comment]
    else
      @comment = UserComment.new
    end
  end

  def edit
    @user = current_user
    if flash.key?(:comment)
      @comment = flash[:comment]
      @note = @comment.note
    end
    note_id = params[:notebook_id]
    comment_id = params[:comment_id]

    @note = Note.find(note_id)
    @comment = UserComment.find(comment_id)
  end

  def generate_error_messages(comment)
    error_details ||= []
    comment.errors.objects.each do |err|
      error_details << err.full_message
    end
    error_details
  end

  def create
    @comment = UserComment.new(allowed_params)
    if @comment.valid?
      if @comment.save
        flash[:success] = "Comment added!"
        redirect_to notebook_path @comment.note_id and return
      end
    end
    flash[:error] = "Could not save comment."
    flash[:error_details] = generate_error_messages @comment
    @user = current_user
    render action: "new"
  end

  def index
    redirect_to notebook_path params[:notebook_id]
  end

  def show
    redirect_to notebook_path params[:notebook_id]
  end

  private
  def allowed_params
    params.require(:comment).permit(:user_id, :note_id, :comment)
  end

end
