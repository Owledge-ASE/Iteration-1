class Tag < ApplicationRecord
    
  def self.searchByTitle(tag_arr)
    result = Tag.where(tag:tag_arr);
    return result
  end

  def self.returnTagsForNote(note)

    return Tag.joins(" 
        INNER JOIN 
        notebook_tags 
        ON #{note.id} = notebook_tags.notebook_id
        AND tags.id = notebook_tags.tag_id
    ")
  end
end
