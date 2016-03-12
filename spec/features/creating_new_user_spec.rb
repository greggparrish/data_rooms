require 'rails_helper'

feature 'Creating a new user' do
  background do
    visit '/'
    click_link 'Register'
  end
  scenario 'can create a new user via the index page' do
    fill_in 'Username', with: 'test_user'
    fill_in 'Email', with: 'test_user@gmail.com'
    fill_in 'Password', with: 'secretp4ss', match: :first
    fill_in 'Password confirmation', with: 'secretp4ss'

    click_button 'Sign up'
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end

  scenario 'requires a user name to successfully create an account' do
    fill_in 'Email', with: 'test_user@gmail.com'
    fill_in 'Password', with: 'secretp4ss', match: :first
    fill_in 'Password confirmation', with: 'secretp4ss'

    click_button 'Sign up'
    expect(page).to have_content("can't be blank")
  end

  scenario 'requires a user name to be more than 4 characters' do
    fill_in 'Username', with: 't'
    fill_in 'Email', with: 'test_user@gmail.com'
    fill_in 'Password', with: 'secretp4ss', match: :first
    fill_in 'Password confirmation', with: 'secretp4ss'

    click_button 'Sign up'
    expect(page).to have_content("minimum is 4 characters")
  end

  scenario 'requires a user name to be less than 16 characters' do
    fill_in 'Username', with: 't' * 17
    fill_in 'Email', with: 'test_user@gmail.com'
    fill_in 'Password', with: 'secretp4ss', match: :first
    fill_in 'Password confirmation', with: 'secretp4ss'

    click_button 'Sign up'
    expect(page).to have_content("maximum is 16 characters")
  end

end
