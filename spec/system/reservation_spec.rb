require 'rails_helper'
RSpec.describe 'Reservations', type: :system do

  let(:reservation) { create(:reservation, end: "2020-01-05 01:29:01", pet: pet ) }
  let(:pet) { create(:pet ) }

  before do
    driven_by(:rack_test)
    visit reservations_path
  end

  context do

    it '期待している文字が表示される' do
      within('div#text-center')
      expect(page).to have_content 'お世話リスト'
    end

    context "現在時刻かどうかは" do
      around do |e|
        travel_to('2020-01-01 10:00'){ e.run }
      end
      it "予定のPETが表示される" do
          expect(page).to have_content 
      end
    end
  end
end