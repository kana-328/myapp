class Condition < ApplicationRecord
  belongs_to :pet, foreign_key: 'pet_id'
  validates :pet_id, presence: true
  validates :recorded_date, presence: true
  validates :recorded_at, presence: true

  def self.csv_attributes
    %w(vitality defecation urination appetite vomit medicine staff)
  end

  def self.generate_csv
    CSV.generate(headers: true) do |csv|
      csv << csv_attributes
      all.each do |condition|
        csv << csv_attributes.map{ |attr| condition.send(attr) }
      end
    end
  end
end
