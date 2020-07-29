require 'rails_helper'

RSpec.describe Pet, type: :model do
  let(:pet) { build(:pet) }

  it "サンプルデータは正しい" do
    expect(pet).to be_valid
  end

  it "nameが空白だとバリデーションにかかる" do
    pet.name = ' '
    expect(pet).not_to be_valid
  end

  it "nameが20文字以上だとバリデーションにかかる" do
    pet.name = 'a' * 21
    expect(pet).not_to be_valid
  end
end
