class NotebooksController < ApplicationController
  def create
    @note = Note.new(allowed_params)
    @ancestors = @note.ancestors
    if @note.valid?
      if @note.save
        #setting up the tags and then tagging the notebook
        unless params[:tags].nil? or params[:tags].empty?
          NotebooksHelper.setupTags(params[:tags])
          NotebooksHelper.setupNotebookTags(@note,params[:tags])
        end
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
    # update the note part
    id = params[:id]
    @note = Note.find(id)
    puts(params[:note][:parent_id])
    puts("test")
    puts(allowed_params[:parent_id])
    @note.update(allowed_params)
    flash[:notice] = "#{@note.title} was successfully updated."
    # upate tags part
    unless params[:tags].nil? or params[:tags].empty?
      NotebooksHelper.setupTags(params[:tags])
      NotebooksHelper.setupNotebookTags(@note,params[:tags])
    end
    # finish update and return
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
      @notes = @notes.sortByColumn(sort_by_col)
    end
  end

  def index
    @ancestors = []
    @notes = NotebooksHelper.find()
  end

  def likes
    current_user.likes_click(params[:notebook_id])
    redirect_to notebook_path(params[:notebook_id])
    return
  end

  def edit
    @note = Note.find(params[:id])
    puts("parentid")
    puts(@note.parent_id)
    tags = NotebooksHelper.getTagsForNotebook(@note)
    @tag_str = ""
    if !(tags.nil? || tags.empty?)
      tags.each do |t|
        @tag_str = @tag_str+t.tag+","
      end
    end
  end

  private
  def allowed_params
    params.require(:note).permit(:title, :description, :parent_id)
  end
end
