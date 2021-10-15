# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating a Person', type: :feature do

  Rails.application.env_config["devise.mapping"] = Devise.mappings[:user]
  Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]

  scenario 'valid inputs' do
    visit root_path
    click_on 'Sign in with Google'
    visit new_person_path

    fill_in :person_uin, with: 727001489
    fill_in 'Name', with: 'Nina Rao'
    fill_in 'Email', with: 'ninarao09@tamu.edu'
    fill_in :person_phone_number, with: '1234567890'
    fill_in 'Address', with: '100 address'
    fill_in :person_person_type, with: 'Player'
    click_on 'Create Person'
    visit people_path
    expect(page).to have_content(727001489)
    expect(page).to have_content('Nina Rao')
    expect(page).to have_content('ninarao09@tamu.edu')
    expect(page).to have_content('1234567890')
    expect(page).to have_content('100 address')
    expect(page).to have_content('Player')
  end

  scenario 'invalid person_id' do
    visit root_path
    click_on 'Sign in with Google'
    visit new_person_path
    fill_in :person_name, with: 'Nina Rao'
    fill_in 'Email', with: 'ninarao09@tamu.edu'
    fill_in :person_phone_number, with: '1234567890'
    fill_in 'Address', with: '100 address'
    fill_in :person_person_type, with: 'Player'
    click_on 'Create Person'
    visit people_path
    expect(page).not_to have_content(727001489)
  end

  scenario 'invalid name' do
    visit root_path
    click_on 'Sign in with Google'
    visit new_person_path
    fill_in :person_uin, with: 727001489
    fill_in 'Email', with: 'ninarao09@tamu.edu'
    fill_in :person_phone_number, with: '1234567890'
    fill_in 'Address', with: '100 address'
    fill_in :person_person_type, with: 'Player'
    click_on 'Create Person'
    visit people_path
    expect(page).not_to have_content('Nina Rao')
  end

  scenario 'invalid email' do
    visit root_path
    click_on 'Sign in with Google'
    visit new_person_path
    fill_in :person_uin, with: 1
    fill_in 'Name', with: 'Nina Rao'
    fill_in :person_phone_number, with: '1234567890'
    fill_in 'Address', with: '100 address'
    fill_in :person_person_type, with: 'Player'
    click_on 'Create Person'
    visit people_path
    expect(page).not_to have_content('ninarao09@tamu.edu')
  end

  scenario 'invalid phone number' do
    visit root_path
    click_on 'Sign in with Google'
    visit new_person_path
    fill_in :person_uin, with: 727001489
    fill_in 'Name', with: 'Nina Rao'
    fill_in 'Email', with: 'ninarao09@tamu.edu'
    fill_in 'Address', with: '100 address'
    fill_in :person_person_type, with: 'Player'
    click_on 'Create Person'
    visit people_path
    expect(page).not_to have_content('1234567890')
  end

  scenario 'invalid address' do
    visit root_path
    click_on 'Sign in with Google'
    visit new_person_path
    fill_in :person_uin, with: 727001489
    fill_in 'Name', with: 'Nina Rao'
    fill_in 'Email', with: 'ninarao09@tamu.edu'
    fill_in :person_phone_number, with: '1234567890'
    fill_in :person_type, with: 'Player'
    click_on 'Create Person'
    visit people_path
    expect(page).not_to have_content('100 address')
  end

  scenario 'invalid person type' do
    visit root_path
    click_on 'Sign in with Google'
    visit new_person_path
    fill_in :person_uin, with: 727001489
    fill_in 'Name', with: 'Nina Rao'
    fill_in 'Email', with: 'ninarao09@tamu.edu'
    fill_in :person_phone_number, with: '1234567890'
    fill_in 'Address', with: '100 address'
    click_on 'Create Person'
    visit people_path
    expect(page).not_to have_content('Player', count: 1)
  end


  scenario 'invalid person type - edit form' do
    visit root_path
    click_on 'Sign in with Google'
    visit edit_person_path
    fill_in :person_uin, with: 727001489
    fill_in 'Name', with: 'Nina Rao'
    fill_in 'Email', with: 'ninarao09@tamu.edu'
    fill_in :person_phone_number, with: '1234567890'
    fill_in 'Address', with: '100 address'
    click_on 'Create Person'
    visit people_path
    expect(page).not_to have_content('Player', count: 1)
  end

end

RSpec.describe 'Authentication', type: :feature do
  Rails.application.env_config["devise.mapping"] = Devise.mappings[:user]
  Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]
  scenario 'visit path without logging in' do
    visit people_path   
    expect(page).to have_content("Please log in!")
  end
  scenario 'visit dashboard after logging in' do
    visit root_path
    click_on 'Sign in with Google'  
    expect(page).to have_content("Navbar")
  end
  scenario 'sign out takes to homepage' do
    visit root_path
    click_on 'Sign in with Google' 
    click_on 'Sign Out'
    expect(page).to have_content("Sign in with Google")
  end
end
