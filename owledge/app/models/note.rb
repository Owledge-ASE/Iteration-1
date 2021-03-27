class Note < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  has_many :tags, :through => :notebook_tags
  has_many :user_comments
  has_many :user_reactions, dependent: :destroy

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
    return Note.where('title LIKE ?', "%#{content}%")
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

  def self.likes
    UserReaction.where(note_id: self.id).count
  end
end
