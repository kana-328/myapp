class Condition < ApplicationRecord
  belongs_to :pet, foreign_key: 'pet_id'

  validates :pet_id, presence: true
  validates :recorded_date, presence: true
  validates :recorded_at, presence: true
end
