class Note < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  has_many :tags, :through => :notebook_tags
  has_many :user_comments

  def self.allParents
    return self.where('parent_id is null')
  end

  def self.ancestors(parent_id = nil)
    if parent_id == nil? or parent_id.blank?
      return [self]
    end
    parent = self.find(parent_id)
    parent.ancestors + [parent]
  end

  
  def self.search(content)
    
    result = Note.union(
      Note.where('title LIKE ?', "%#{content}%"),Note.joins("
      INNER JOIN 
      notebook_tags 
      ON notes.id = notebook_tags.notebook_id
      INNER JOIN 
      tags 
      ON tags.id = notebook_tags.tag_id
      AND tag  LIKE ('%#{content}%')")
    )
    return result
  end

  def self.sort_by_column(sort_by_col)
    @sort_string = sort_by_col.gsub("-", " ")
    return self.order(@sort_string)
  end
  def children
    return Note.where(parent_id: self.id).all
  end

  def parent
    if self.parent_id?
      Note.find(self.parent_id)
    else
      nil
    end
  end

  def ancestors
    if !self.parent_id?
      return []
    end
    self.parent.ancestors + [self.parent]
  end
end
