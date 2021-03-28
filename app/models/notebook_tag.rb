class NotebookTag < ApplicationRecord
  has_many :tags
  has_many :notes
end
