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
      @ancestors = []
      redirect_to new_notebook_path(:parent=> allowed_params[:parent_id])
    end
  end
  def new
    @ancestors = []
    parent = params[:parent]
    unless parent.nil? or parent.empty?
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
    @ancestors = []
    searchContent = params[:search_by_contain]
    if searchContent.nil? || searchContent.empty?
      @notes = Note.allParents
    else
      @notes = Note.search(searchContent)
    end
    
  end
  def sort
    @ancestors = []
    sort_by_col = params[:sort_by_col]
    @notes = Note.allParents
    if !(sort_by_col.nil? || sort_by_col.empty?)
      @notes = @notes.sort_by_column(sort_by_col)
    end
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
