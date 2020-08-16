class Body < ApplicationRecord
  belongs_to :pet, foreign_key: 'pet_id'
  validates :pet_id, presence: true
  validates :weight, presence: true
end
