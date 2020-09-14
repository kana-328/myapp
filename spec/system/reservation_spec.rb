require 'rails_helper'
RSpec.describe 'Reservations', type: :system do
  let!(:reservation) { create(:reservation, start: "2020-01-01", end: "2020-01-05", pet: pet) }
  let!(:pet) { create(:pet) }

  before do
    driven_by(:rack_test)
    visit reservations_path
  end

  around do |e|
    travel_to('2020-01-01') { e.run }
  end
  it '期待している文字が表示される' do
    within('div#text-center')
    expect(page).to have_content 'お世話リスト'
    expect(page).to have_content Date.today
  end
end
