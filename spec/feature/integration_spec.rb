# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating an Event', type: :feature do

  Rails.application.env_config["devise.mapping"] = Devise.mappings[:user]
  Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]

  scenario 'valid inputs for new event page' do
    visit root_path
    click_on 'Sign in with Google'
    visit new_event_path

    fill_in 'Name', with: 'Practice 1'
    fill_in 'event_info', with: 'First practice of the season'
    fill_in 'Date', with: '2021-03-09'
    fill_in 'Time', with: '2000-01-01 16:37:00 UTC'
    click_on 'Create Event'
    visit events_path
    expect(page).to have_content('Practice 1')
    expect(page).to have_content('First practice of the season')
    expect(page).to have_content('2021-03-09')
    expect(page).to have_content('2000-01-01 16:37:00 UTC')
  end

  scenario 'invalid name' do
    visit root_path
    click_on 'Sign in with Google'
    visit new_event_path

    fill_in 'event_info', with: 'First practice of the season'
    fill_in 'Date', with: '2021-03-09'
    fill_in 'Time', with: '2000-01-01 16:37:00 UTC'
    click_on 'Create Event'
    visit events_path
    expect(page).not_to have_content('Practice 1')

  end
  scenario 'invalid info' do
    visit root_path
    click_on 'Sign in with Google'
    visit new_event_path

    fill_in 'Name', with: 'Practice 1'
    fill_in 'Date', with: '2021-03-09'
    fill_in 'Time', with: '2000-01-01 16:37:00 UTC'
    click_on 'Create Event'
    visit events_path
    expect(page).not_to have_content('First practice of the season')
  end
end

RSpec.describe 'Editing an Event', type: :feature do
  Rails.application.env_config["devise.mapping"] = Devise.mappings[:user]
  Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]
    
  scenario 'valid inputs' do
    visit root_path
    click_on 'Sign in with Google'
    visit new_event_path

    fill_in 'Name', with: 'Practice 1'
    fill_in 'event_info', with: 'First practice of the season'
    fill_in 'Date', with: '2021-03-09'
    fill_in 'Time', with: '2000-01-01 16:37:00 UTC'
    click_on 'Create Event'
    visit events_path

    click_on 'Edit'
    fill_in 'event_info', with: 'Introduction and team formation practice.'
    click_on 'Update Event'
    visit events_path
    expect(page).to have_content('Practice 1')
    expect(page).to have_content('Introduction and team formation practice.')
    expect(page).to have_content('2021-03-09')
    expect(page).to have_content('2000-01-01 16:37:00 UTC')
  end

  scenario 'invalid inputs' do
    visit root_path
    click_on 'Sign in with Google'
    visit new_event_path

    fill_in 'Name', with: 'Practice 1'
    fill_in 'event_info', with: 'First practice of the season'
    fill_in 'Date', with: '2021-03-09'
    fill_in 'Time', with: '2000-01-01 16:37:00 UTC'
    click_on 'Create Event'
    visit events_path

    click_on 'Edit'
    fill_in 'Date', with: nil
    click_on 'Update Event'
    visit events_path
    expect(page).to have_content('Practice 1')
    expect(page).to have_content('First practice of the season')
    expect(page).not_to have_content('2021-03-09')
    expect(page).to have_content('2000-01-01 16:37:00 UTC')
  end
end

RSpec.describe 'Deleting an event', type: :feature do
  Rails.application.env_config["devise.mapping"] = Devise.mappings[:user]
  Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]
    
  scenario 'Clicking the button' do
    visit root_path
    click_on 'Sign in with Google'
    visit new_event_path

    fill_in 'Name', with: 'Practice 1'
    fill_in 'event_info', with: 'First practice of the season'
    fill_in 'Date', with: '2021-03-09'
    fill_in 'Time', with: '2000-01-01 16:37:00 UTC'
    click_on 'Create Event'
    visit events_path

    click_on 'Delete'
    click_on 'Delete Event'
    visit events_path

    expect(page).not_to have_content('Practice 1')
    expect(page).not_to have_content('First practice of the season')
    expect(page).not_to have_content('2021-03-09')
    expect(page).not_to have_content('2000-01-01 16:37:00 UTC')
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
