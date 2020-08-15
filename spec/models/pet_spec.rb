require 'rails_helper'

RSpec.describe Pet, type: :model do
  let(:pet) { build_stubbed(:pet) }

  it "サンプルデータが正しい状態である" do
    expect(pet).to be_valid
  end

  it "nameが空白だと無効な状態である" do
    pet.name = ' '
    expect(pet).not_to be_valid
  end

  it "nameが20文字以上だと無効な状態である" do
    pet.name = 'a' * 21
    expect(pet).not_to be_valid
  end

  it 'user_idがないと無効な状態である' do
    pet.user_id = ''
    expect(pet).not_to be_valid
  end
end
