class Note < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  has_many :tags, :through => :notebook_tags
  has_many :user_comments
  has_many :user_reactions, dependent: :destroy
  belongs_to :publisher, :class_name => 'User', :foreign_key => "publisher_id", :optional => true
  belongs_to :parent, :class_name => 'Note', :foreign_key => 'parent_id', :optional => true
  #has_many :user, :through => :user_reactions, :as => :users_liking_note
  #has_many :user, :through => :user_comments, :as => :users_commenting_on

  def self.all_parents
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
    content = content.downcase
    result = Note.union(
      Note.where('LOWER(title) LIKE ?', "%#{content}%"),Note.joins("
      INNER JOIN 
      notebook_tags 
      ON notes.id = notebook_tags.notebook_id
      INNER JOIN 
      tags 
      ON tags.id = notebook_tags.tag_id
      AND LOWER(tag)  LIKE ('%#{content}%')")
    )
    return result
  end

  def self.sort_by_column(sort_by_col)
    if sort_by_col.include? "likes"
      sort_arr = sort_by_col.split("-")
      return self.joins('
      LEFT OUTER JOIN 
      "user_reactions" 
      ON "notes"."id" = "user_reactions"."note_id"').group("notes.id").order("sum(like) #{sort_arr[1]}")
    else
      @sort_string = sort_by_col.gsub("-", " ")
      return self.order(@sort_string)
    end
  end
  def children
    Note.where(parent_id: self.id).all
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

  def short_description(words = 30)
    description = self.description
    desc = description.nil?  ? "" : description.split(' ')[0..words].join(' ')
    if not description.nil? and desc.length < description.length
      return desc + '...'
    end
    desc
  end

  def as_json(options)
    super(options).merge({
      'short_description' => self.short_description
    })
  end

  #Counts the number of total likes by unique users for a given note
  def likes
    UserReaction.where(note_id: self.id, like: 1).count
  end
  #Provides the notes that the given user created
  #def notes_created(user_id)
  #Note.where(publisher_id: user_id)
  #end
end
