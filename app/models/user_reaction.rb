class UserReaction < ApplicationRecord
  belongs_to :user
  belongs_to :note

  def self.get_like(user_id, note_id)
    reaction = UserReaction.where(user_id: user_id, note_id: note_id).first
    if reaction.nil?
      reaction = UserReaction.create(note_id: note_id, user_id: user_id, like: false)
    end
    reaction
  end

  def get_like
    if self.like.nil?
      0
    else
      self.like ? 1 : 0
    end
  end

  def do_like
    self.like = self.get_like.zero?
  end
end
