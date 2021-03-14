class NotebooksController < ApplicationController
  def new

  end
  def show
    id = params[:id]
    @notes = Note.find(id)
  end
  def index
    @notes = Note.allParents
  end
end
