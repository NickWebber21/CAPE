class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :rememberable, :validatable #, :recoverable

  has_many :evaluations, dependent: :destroy
  has_many :authors, dependent: :destroy
  has_many :presentations, through: :authors
end
