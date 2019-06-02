module TestHelper
  def login(user)
    visit '/login'
    within(".session") do
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
    end
    click_button 'Log In'
  end
end