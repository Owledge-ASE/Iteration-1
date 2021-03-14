class NotebooksController < ApplicationController
  def create
    @note = Note.new(allowed_params)
    if @note.save
      redirect_to notebook_path @note
    else
      render 'new'
    end
  end
  def new
    @ancestors = []
    parent = params[:parent]
    if parent
      @ancestors = Note.ancestors(parent)
    end
  end
  def show
    id = params[:id]
    @note = Note.find(id)
    @ancestors = @note.ancestors
  end
  def index
    @ancestors = []
    @notes = Note.allParents
  end

  private
  def allowed_params
    params.require(:note).permit(:title, :description, :parent_id)
  end
end
