class Reservation < ApplicationRecord
  belongs_to :user, foreign_key: 'pet_id'
  validates :start, presence: true
  validates :end, presence: true
end
