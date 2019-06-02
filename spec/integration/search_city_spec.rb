require 'rails_helper'

describe "Searching city and adding it to user listed cities", type: :feature do
  context 'providing valid name' do
    it 'should return forecast data' do
      john = create(:john)
      warszawa = create(:warszawa)
      login(john)
      visit '/'
      click_on 'Search your city'
      fill_in 'search', with: 'Warszawa'
      click_on 'Search'
      expect(page).to have_content '5 day forecast for:'
      expect(page).to have_content 'Warszawa'
      click_on 'Add to your cities'
      expect(john.cities).to contain_exactly(warszawa)
    end
  end

  context 'providing invalid name in search' do
    it 'should return message of no cities found' do
      john = create(:john)
      login(john)
      visit '/'
      click_on 'Search your city'
      fill_in 'search', with: 'Atlantis'
      click_on 'Search'
      expect(page).to have_content 'No Cities found'
    end
  end
end
