class UserComment < ApplicationRecord
  belongs_to :user
  validates :comment, presence: true
  validates_length_of :comment, minimum: 10
end
