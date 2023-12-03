class Presentation < ApplicationRecord
  has_many :users, through: :authors
  has_many :evaluations, dependent: :destroy

end
