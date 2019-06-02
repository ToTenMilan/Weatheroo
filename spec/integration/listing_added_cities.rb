require 'rails_helper'

describe "Added cities", type: :feature do
  before :each do
    john = create(:john)
    warszawa = create(:warszawa)
    zion = create(:zion)
    john.cities << warszawa << zion

    login john
    visit '/'
  end

  context 'listing of all cities added by user' do
    it 'should list all cities added by user' do
      expect(page).to have_content 'Warszawa'
      expect(page).to have_content 'Zion'
    end

    it 'should be able to click on city tile to show its forecast' do
      click_on 'Warszawa'
      expect(page).to have_content '5 day forecast for:'
      expect(page).to have_content 'Warszawa'

      expect(page).to have_content 'Hour and Day'
      expect(page).to have_content 'Weather'
      expect(page).to have_content 'Temperature'
      expect(page).to have_content 'Air pressure'
      expect(page).to have_content 'Air humidity'
      expect(page).to have_content 'Wind speed'
    end
  end

  context 'going straight to city show page' do
    visit "/cities/#{warszawa.id}"

    expect(page).to have_content '5 day forecast for:'
    expect(page).to have_content 'Warszawa'
  end
end
