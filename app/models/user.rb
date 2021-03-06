class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :email, presence: true, uniqueness: true
  has_many :user_comments, :foreign_key => :user_id
  has_many :user_reactions, dependent: :destroy, :foreign_key => :user_id
  has_many :notes_commented, -> { distinct }, :through => :user_comments, :source => :note
  has_many :notes_liked, :through => :user_reactions, :source => :note

  def display_name
    if first_name.nil?
      last_name
    else
      first_name + " " + last_name
    end
  end

  #Checks if user has already reacted to this note
  # Creates reaction if new user
  # Inverts 'like' boolean based on user click
  def is_like_clicked?(note_id)
    UserReaction.get_like(self.id, note_id)
  end

  def likes_click(note_id)
    reaction = UserReaction.get_like(self.id, note_id)
    reaction.do_like
    reaction.save
    reaction.like
  end
end
