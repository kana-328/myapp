class Reservation < ApplicationRecord
  belongs_to :pet, foreign_key: 'pet_id'
  validates :start, presence: true
  validates :end, presence: true
end
