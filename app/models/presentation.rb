class Presentation < ApplicationRecord
  has_many :authors
  has_many :users, through: :authors
end
