class Condition < ApplicationRecord
  belongs_to :pet, foreign_key: 'pet_id'
end
