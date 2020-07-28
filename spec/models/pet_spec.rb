require 'rails_helper'

RSpec.describe Pet, type: :model do

  let(:pet) { build(:pet) }

  it "サンプルデータは正しい" do
    expect(pet).to be_valid
  end
end
