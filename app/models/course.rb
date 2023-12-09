class Course < ApplicationRecord
    validates :name, presence: true, uniqueness: true, length: { minimum: 4 }

    
    has_many :users, dependent: :destroy
    has_many :presentations, dependent: :destroy
end
