class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :email, presence: true, uniqueness: true
  has_many :user_comments, :foreign_key => :user_id
  has_many :user_reactions, dependent: :destroy, :foreign_key => :user_id

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
  def is_like_clicked(note_id)
    reaction = UserReaction.where(user_id: self.id, note_id: note_id).first
    if reaction.nil? or reaction.empty?
      print("1=========(reaction is nil/empty)========\n")
      reaction = UserReaction.create(note_id: note_id, user_id: self.id, like: false)
      reaction.save
      return reaction[:like]
    else
    #reaction[:like] = !reaction[:like]
    #reaction.save

    print("\n00===========(errors count)==============\n")
    print(reaction.errors)
    print("\n000=============(reaction.note_id)============\n")
    print(reaction.note_id)
    print("\n0000=============(reaction.errors.invalid?[:like])============\n")
    print(reaction.invalid?)
    print("\n0000===========================================\n")

    return reaction[:like]
    end
  end

  #Unnecessary?
  def likes_click(note_id)
    reaction = UserReaction.where(user_id: self.id, note_id: note_id).first

    print("\n================(reaction.invalid?)===============\n")
    print(reaction.nil?)
    print("\n================================================\n")

    reaction[:like] = !reaction[:like]

    print("\n================(reaction.like)===============\n")
    print(reaction.like)
    print("\n===============================================\n")

    reaction.save
    return reaction[:like]
  end
end
