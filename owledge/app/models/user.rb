class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :email, presence: true, uniqueness: true
  has_many :user_comments, :foreign_key => :user_id

  def display_name
    if first_name.nil?
      last_name
    else
      first_name + " " + last_name
    end
  end
end
