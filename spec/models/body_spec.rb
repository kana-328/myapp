require 'rails_helper'

RSpec.describe Body, type: :model do
  let(:body) { build_stubbed(:body) }

  it "サンプルデータが正しい状態である" do
    expect(body).to be_valid
  end

  it "pet_idが空白だと無効な状態である" do
    body.pet_id = ' '
    expect(body).not_to be_valid
  end

  it "weightが空白だと無効な状態である" do
    body.weight = ' '
    expect(body).not_to be_valid
  end

  it "recorded_dateが空白だと無効な状態である" do
    body.recorded_date = ' '
    expect(body).not_to be_valid
  end
end
