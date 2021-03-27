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

end
