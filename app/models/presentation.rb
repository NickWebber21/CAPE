class Presentation < ApplicationRecord
  has_many :authors, dependent: :destroy
  has_many :users, through: :authors
  has_many :evaluations, dependent: :destroy
  belongs_to :course

  serialize :selected_authors, Array
end
