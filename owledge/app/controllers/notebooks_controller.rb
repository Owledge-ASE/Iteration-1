class NotebooksController < ApplicationController
  @ancestors = []
  def new
  end
  def show
    id = params[:id]
    @note = Note.find(id)
  end
  def index
    @ancestors = []
    @notes = Note.allParents
  end

  private
  def ancestors(note)
    [note.parent]
  end
end
