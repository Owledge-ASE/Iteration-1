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

  def destroy
    user_comment = UserComment.find(params[:id])
    if current_user.id != user_comment.user_id
      flash[:error] = "You cannot perform this action."
      redirect_to notebook_path user_comment.note_id and return
    end
    UserComment.delete(allowed_deletion_params)
    flash[:success] = "Comment deleted."
    redirect_to notebook_path params[:notebook_id]
  end

  def edit
    @user = current_user
    note_id = params[:notebook_id]
    comment_id = params[:id]

    @note = Note.find(note_id)
    @comment = UserComment.find(comment_id)

    if @comment.user_id != @user.id
      flash[:error] = "You cannot perform this action."
      redirect_to notebook_comment_path note_id
    end
  end

  def update
    @comment = UserComment.update(params[:id], allowed_params)
    if @comment.valid?
      if @comment.save!
        flash[:success] = 'Comment updated!'
        redirect_to notebook_path @comment.note_id and return
      end
    end
    flash[:error] = "Could not save comment."
    flash[:error_details] = generate_error_messages @comment

    @user = current_user
    render action: "edit"
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

  def allowed_deletion_params
    params.require(:id)
  end

end
