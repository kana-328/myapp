class Reservation < ApplicationRecord
  belongs_to :pet, foreign_key: 'pet_id'
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :title, presence: true
end
