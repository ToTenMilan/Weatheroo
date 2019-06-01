describe "Authentication", type: :feature do
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

  it "logs me in and out" do
    #log in
    user = create(:user)
    visit '/login'
    within(".session") do
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
    end
    click_button 'Log In'
    expect(page).to have_content 'You have logged in successfully'
    # log out
    visit '/logout'
    expect(page).to have_content 'Not authorized'
  end
end