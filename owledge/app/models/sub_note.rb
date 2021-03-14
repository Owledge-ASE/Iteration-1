class SubNote < ApplicationRecord
    def self.allParents
        return self.where('parent_id is null or parent_id=""')
    end
end
