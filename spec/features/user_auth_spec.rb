require 'rails_helper'

feature 'User authentication' do
  background do
    user = create(:user)
  end

  scenario 'Log in from root' do
    visit '/'
    click_link 'Login'
    fill_in 'Email', with: 'test_user@gmail.com'
    fill_in 'Password', with: 'secretp4ss'
    click_button 'Log in'

    expect(page).to have_content('Signed in successfully.')
    expect(page).to_not have_content('Login')
    expect(page).to_not have_content('Register')
    expect(page).to have_content('Log out')
  end

  scenario 'Log out' do
    visit '/'
    click_link 'Login'
    fill_in 'Email', with: 'test_user@gmail.com'
    fill_in 'Password', with: 'secretp4ss'
    click_button 'Log in'

    click_link 'Log out'
    expect(page).to have_content('Signed out successfully')
  end

end
