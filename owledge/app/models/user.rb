class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :email, presence: true, uniqueness: true
  has_many :user_comments, :foreign_key => :user_id
  has_many :user_reactions, dependent: :destroy, :foreign_key => :user_id

  def display_name
    first_name + " " + last_name
  end

  def likes_note(note_id)
    UserReaction.where(user_id: self.id, note_id: note_id).like
  end
end
