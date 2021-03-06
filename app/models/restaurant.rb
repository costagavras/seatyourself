class Restaurant < ApplicationRecord
  has_many :reservations
  belongs_to :category
  belongs_to :neighbourhood
  belongs_to :user

validates :name, presence: { message: "field must be filled out!" }
validates :summary, presence: { message: "field must be filled out!" }
validates :address, presence: { message: "field must be filled out!" }
validates :menu, presence: { message: "field must be filled out!" }
validates :picture_url, presence: { message: "field must be filled out!" }
validates :capacity, numericality: {only_integer: true}, presence: { message: "field must be filled out!" }
# validates :price_range, inclusion: [1, 2, 3]

end
