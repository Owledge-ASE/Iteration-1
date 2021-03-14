class Note < ApplicationRecord
  def self.allParents
    return self.where('parent_id is null')
  end

  def self.ancestors(parent_id)
    parent = self.find(parent_id)
    parent.ancestors + [parent]
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
