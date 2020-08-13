require 'rails_helper'
RSpec.describe Condition, type: :model do

  let(:condition) { build_stubbed(:condition) }

  it "サンプルデータが正しい状態である" do
    expect(condition).to be_valid
  end

  it "pet_idが空白だと無効な状態である" do
    condition.pet_id = ' '
    expect(condition).not_to be_valid
  end

  it "recorded_atが空白だと無効な状態である" do
    condition.recorded_at = ' '
    expect(condition).not_to be_valid
  end

  it "recorded_dateが空白だと無効な状態である" do
    condition.recorded_date = ' '
    expect(condition).not_to be_valid
  end

end
