require 'rails_helper'

describe "Authentication", type: :feature do
  context 'registration' do
    it 'signs me up' do
      visit '/signup'
      password = BCrypt::Password.create('password')
      within('.registration') do
        fill_in 'Email', with: 'sample@foo.com'
        fill_in 'Password', with: password
        fill_in 'Password confirmation', with: password
      end
      click_button 'Sign Up'
      expect(page).to have_content 'You have signed up successfully'
      expect(User.first.email).to eq('sample@foo.com')
    end

    it 'dont sign me up when I provide existing email' do
      john = create(:john)
      visit '/signup'
      password = BCrypt::Password.create('password')
      within('.registration') do
        fill_in 'Email', with: john.email
        fill_in 'Password', with: 'irrelevant'
        fill_in 'Password confirmation', with: 'irrelevant'
      end
      click_button 'Sign Up'
      expect(page).to have_content 'Email has already been taken'
      expect(User.count).to equal 1
    end

    it 'deletes account with success' do
      john = create(:john)
      login(john)
      click_on 'Delete Account'
      expect(page).to have_content 'You have deleted your account'
      expect(User.count).to eq 0
    end
  end

  context 'Authentication' do
    it "logs me in and out" do
      #log in
      john = create(:john)
      visit '/login'
      within(".session") do
        fill_in 'Email', with: john.email
        fill_in 'Password', with: john.password
      end
      click_button 'Log In'
      expect(page).to have_content 'You have logged in successfully'
      expect(page).to have_content 'Here is the forecast for authenticated users'
      # log out
      visit '/logout'
      expect(page).to have_content 'You have logged out successfully'
      expect(page).to_not have_content 'Here is the forecast for authenticated users'
    end

    it 'do not log in with bad credentials' do
      john = create(:john)
      visit '/login'
      within(".session") do
        fill_in 'Email', with: john.email
        fill_in 'Password', with: 'wrong'
      end
      click_button 'Log In'
      expect(page).to have_content 'Invalid email or password'
    end
  end
end
