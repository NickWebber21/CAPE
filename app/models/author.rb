class Author < ApplicationRecord
  belongs_to :user
  belongs_to :presentation
end
