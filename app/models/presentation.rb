class Presentation < ApplicationRecord
  has_many :authors, dependent: :destroy
  has_many :users, through: :authors
  has_many :evaluations, dependent: :destroy

  serialize :selected_authors, Array
end
