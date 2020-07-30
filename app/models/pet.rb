class Pet < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'

  validates :name, presence: true, length: { maximum: 20 }
end
