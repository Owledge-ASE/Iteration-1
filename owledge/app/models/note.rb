class Note < ApplicationRecord
  def self.allParents
    return self.where('parent_id is null')
  end
end
