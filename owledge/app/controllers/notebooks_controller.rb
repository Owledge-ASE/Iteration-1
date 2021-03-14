




class NotebooksController < ApplicationController
  def new

  end
  def show
    
  end
  def index
    @notes = SubNote.allParents
  end
end
