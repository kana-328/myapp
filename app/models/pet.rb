class Pet < ApplicationRecord
  belongs_to :user

  validates :name, presence: true, length: { maximum: 20 }
  validates :age,  numericality: { only_integer: true }

end
