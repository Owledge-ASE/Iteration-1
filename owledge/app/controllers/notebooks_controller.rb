class NotebooksController < ApplicationController
  def create
    @note = Note.new(allowed_params)
    @ancestors = @note.ancestors
    if @note.valid?
      if @note.save
        redirect_to notebook_path @note
        return
      end
    else
      flash[:error] = 'Kindly enter a title and description'
    end
    render'new'
  end
  def new
    @ancestors = []
    parent = params[:parent]
    if parent
      @ancestors = Note.ancestors(parent)
    end
  end
  def show
    flash[:error] = nil
    id = params[:id]
    begin
      @note = Note.find(id)
    rescue ActiveRecord::RecordNotFound => e
      flash[:error] = "Could not find a note with ID #{id}"
      redirect_to '/' and return
    end
    @ancestors = @note.ancestors
  end
  def search
    
  end
  def sort
    @ancestors = []
    sort_by_col = params[:sort_by_col]
    searchContent = params[:search_by_contain]
    logger.debug(searchContent)
    if searchContent.nil? || searchContent.empty?
      @notes = Note.allParents
    else
      @notes = Note.search(searchContent)
    end
    if !(sort_by_col.nil? || sort_by_col.empty?)
      @notes = @notes.sort_by_column(sort_by_col)
    end
  end

  def index
    @ancestors = []
    searchContent = params[:search_by_contain]
    logger.debug(searchContent)
    if searchContent.nil? || searchContent.empty?
      @notes = Note.allParents
    else
      @notes = Note.search(searchContent)
    end
  end

  private
  def allowed_params
    params.require(:note).permit(:title, :description, :parent_id)
  end
end
