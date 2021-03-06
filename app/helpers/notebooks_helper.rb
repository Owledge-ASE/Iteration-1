include Devise::Controllers::Helpers

module NotebooksHelper
  def self.checkSortDirection(curr_col,sort_by_col)
    delimiter = "-"
    if (sort_by_col.nil? || sort_by_col.empty?)
      return curr_col+delimiter+"asc"
    end
    sort_by_arr = sort_by_col.split(delimiter)
    if sort_by_arr[0] == curr_col && sort_by_arr[1] == "asc"
      return curr_col+delimiter+"desc"
    end
    return curr_col+delimiter+"asc"
  end

  def self.breakDownTags(tag_list)
    tag_arr = tag_list.split(',')
    return tag_arr
  end
  #setupping the tags in the tag table first checks if tag exists or not
  def self.setupTags(tag_list)
    tag_arr = self.breakDownTags(tag_list.downcase)
    existing_tags  = Tag.searchByTitle(tag_arr)

    tag_arr.each do |tag|
      flag = 0
      existing_tags.each do |tagRow|
        if tagRow.tag == tag
          flag = 1
        end
      end 
      if flag == 0
        new_tag = Tag.create(tag:tag)
      end
    end
  end

  #setting up the notebook tags
  def self.setupNotebookTags(note,tag_list)

    tag_arr = self.breakDownTags(tag_list.downcase)
    existing_tags  = Tag.searchByTitle(tag_arr)
    NotebookTag.where(:notebook_id => note.id).destroy_all
    
    existing_tags.each do |tagRow|
      NotebookTag.create(notebook_id:note.id,tag_id:tagRow.id)
    end
  end

  def self.getTagsForNotebook(note)
    return Tag.returnTagsForNote(note)
  end

  def self.find(searchContent = nil)
    if searchContent.nil? || searchContent.empty?
      return Note.all_parents
    else
      return Note.search(searchContent)
    end
  end

  def self.notes_with_filters(filter, user)
    @notes = []
    if user.nil?
      return @notes
    end

    case filter
    when 'all_notebooks'
      Note.all_parents
    when 'notes_created'
      Note.where(publisher_id: user.id)
    when 'notes_liked'
      user.notes_liked
    when 'notes_commented'
      user.notes_commented
    else
      []
    end
  end

  def self.dropdown_class(active)
    "dropdown-item" + (active ? " active" : "")
  end
end
