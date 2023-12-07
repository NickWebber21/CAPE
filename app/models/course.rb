class Course < ApplicationRecord
    has_many :users, dependent: :destroy
    has_many :presentations, dependent: :destroy
end
