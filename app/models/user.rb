class User < ApplicationRecord
  has_secure_password

  has_many :reservations
  has_many :restaurants

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
end
