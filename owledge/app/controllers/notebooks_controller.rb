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
      params[:parent] = allowed_params[:parent_id]
      if allowed_params[:parent_id].nil? or allowed_params[:parent_id].empty?
        params[:show_breadcrumb_header] = "New Note"
      else 
        params[:show_breadcrumb_header] = "New Sub-Note"
      end

      render 'new'
      #redirect_to new_notebook_path(:parent=> allowed_params[:parent_id])
    end
  end
  def update
    id = params[:id]
    @note = Note.find(id)
    @note.update(allowed_params)
    flash[:notice] = "#{@note.title} was successfully updated."
    redirect_to notebook_path(@note)
  end
  def new
    @ancestors = []
    parent = params[:parent]
    unless parent.nil? or parent.empty?
      @ancestors = Note.ancestors(parent)
    end
  end
  def show
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

  def index
    @ancestors = []
    searchContent = params[:search_by_contain]
    if searchContent.nil? || searchContent.empty?
      @notes = Note.allParents
    else
      @notes = Note.search(searchContent)
    end
    
  end

  def sort
    flash[:error] = nil
    @ancestors = []
    sort_by_col = params[:sort_by_col]
    @notes = Note.allParents
    if !(sort_by_col.nil? || sort_by_col.empty?)
      @notes = @notes.sort_by_column(sort_by_col)
    end
  end

  def index
    flash[:error] = nil
    @ancestors = []
    @notes = Note.allParents
  end
  def edit
    @note = Note.find(params[:id])
  end

  private
  def allowed_params
    params.require(:note).permit(:title, :description, :parent_id)
  end
end
