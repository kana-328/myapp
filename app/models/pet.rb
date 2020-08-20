class Pet < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'
  has_many :reservations, dependent: :destroy
  has_many :bodies, dependent: :destroy
  has_many :conditions, dependent: :destroy
  validates :name, presence: true, length: { maximum: 20 }
  validates :user_id, presence: true
end
