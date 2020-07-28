class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :pets, dependent: :destroy

  before_save { self.email = email.downcase }
  validates :firstname, presence: true, length: { maximum: 15 },
  validates :lastname, allow_blank: true,length: { maximum: 15 }, 
  validates :email, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { in: 4..6 }
  validates :tel, presence: true, format: { with: /\A\d{10}\z|\A\d{11}\z/ }
  validates :address, allow_blank: true, length: { maximum: 100 }

end
