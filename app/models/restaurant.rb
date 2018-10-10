class Restaurant < ApplicationRecord
  has_many :reservations
  belongs_to :category
  belongs_to :neighbourhood
  has_and_belongs_to_many :users
end
