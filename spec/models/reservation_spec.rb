require 'rails_helper'
RSpec.describe Reservation, type: :model do
  let(:reservation) { build(:reservation, end: "2020-01-05 01:29:01", pet: pet) }
  let(:pet) { create(:pet) }

  it "サンプルデータが正しい状態である" do
    expect(reservation).to be_valid
  end

  it "pet_idが空白だと無効な状態である" do
    reservation.pet_id = ' '
    expect(reservation).not_to be_valid
  end

  it "startが空白だと無効な状態である" do
    reservation.start = ' '
    expect(reservation).not_to be_valid
  end

  it "end_dateが空白だと無効な状態である" do
    reservation.end = ' '
    expect(reservation).not_to be_valid
  end

  it "titleが空白だと無効な状態である" do
    reservation.title = ' '
    expect(reservation).not_to be_valid
  end
end
