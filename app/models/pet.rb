class Pet < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'
  has_many :reservations, dependent: :destroy
  has_many :bodies, dependent: :destroy
  has_many :conditions, dependent: :destroy
  mount_uploader :image, ImageUploader
  validates :name, presence: true, length: { maximum: 20 }
  validates :user_id, presence: true
  validate :image_size

  private

  def image_size
    if image.size > 5.megabytes
      errors.add(:image, "画像のサイズが大きいです")
    end
  end
end
