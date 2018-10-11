class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant

  validates :date_time, presence: true
  validates :party_size, presence: true
end
