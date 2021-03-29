class UserReaction < ApplicationRecord
  belongs_to :user
  belongs_to :note, polymorphic: true
end
