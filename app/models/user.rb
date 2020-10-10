class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :pets, dependent: :destroy

  before_save { self.email = email.downcase }
  devise :validatable, password_length: 4..6
  validates :firstname, presence: true, length: { maximum: 15 }
  validates :lastname, allow_blank: true, length: { maximum: 15 }
  validates :email, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  validates :tel, presence: true, format: { with: /\A\d{10}\z|\A\d{11}\z/ }
  validates :address, allow_blank: true, length: { maximum: 100 }

  def update_without_current_password(params, *options)
    params.delete(:current_password)
    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end

    result = update_attributes(params, *options)
    clean_up_passwords
    result
  end

  def self.csv_attributes
    %w(id firstname lastname address email tel)
  end

  def self.generate_csv
    CSV.generate(headers: true) do |csv|
      csv << csv_attributes
      all.each do |task|
        csv << csv_attributes.map { |attr| task.send(attr) }
      end
    end
  end

  def self.import(file)
    CSV.foreach(file.path, headers: true,  encoding: 'UTF-8') do |row|
      # IDが見つかれば、レコードを呼び出し、見つかれなければ、新しく作成
      user = find_by(id: row["id"]) || new
      # CSVからデータを取得し、設定する
      user.attributes = row.to_hash.slice(*updatable_attributes)
      user.save!(validate: false)
    end
  end

  def self.updatable_attributes
    ['id', 'firstname', 'lastname', 'address', 'email', 'tel']
  end

  scope :sorted, -> { order(created_at: :desc) }
end
