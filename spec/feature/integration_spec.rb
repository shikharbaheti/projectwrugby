# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating a Merch', type: :feature do
  Rails.application.env_config["devise.mapping"] = Devise.mappings[:user]
  Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]

  scenario 'valid inputs' do
    visit root_path
    click_on 'Sign in with Google'
    visit new_merchandise_path
    fill_in :merchandise_item_name, with:'Sweatshirt'
    fill_in :merchandise_purchase_price, with: 20
    fill_in :merchandise_quantity_on_hand, with: 5
    fill_in :merchandise_sell_price, with: 40
    click_on 'Create Merchandise'
    visit merchandises_path
    expect(page).to have_content('Sweatshirt')
    expect(page).to have_content(20)
    expect(page).to have_content(5)
    expect(page).to have_content(40)
  end
  scenario 'invalid item name' do
    visit root_path
    click_on 'Sign in with Google'
    visit new_merchandise_path
    fill_in :merchandise_purchase_price, with: 20
    fill_in :merchandise_quantity_on_hand, with: 5
    fill_in :merchandise_sell_price, with: 40
    click_on 'Create Merchandise'
    visit merchandises_path
    expect(page).not_to have_content('Sweatshirt', count: 1)
  end
end

RSpec.describe 'Deleting Merch', type: :feature do
  Rails.application.env_config["devise.mapping"] = Devise.mappings[:user]
  Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]

  scenario 'Clicking the button' do
    visit root_path
    click_on 'Sign in with Google'
    visit new_merchandise_path
    fill_in :merchandise_item_name, with:'Sweatshirt'
    fill_in :merchandise_purchase_price, with: 20
    fill_in :merchandise_quantity_on_hand, with: 5
    fill_in :merchandise_sell_price, with: 40
    click_on 'Create Merchandise'
    visit merchandises_path

    click_on 'Delete'
    click_on 'Delete Merchandise'
    visit merchandises_path

    expect(page).not_to have_content('Sweatshirt')
    expect(page).not_to have_content(20)
    expect(page).not_to have_content(5)
    expect(page).not_to have_content(40)

  end
end

RSpec.describe 'Editing a Person', type: :feature do
  Rails.application.env_config["devise.mapping"] = Devise.mappings[:user]
  Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]

  scenario 'valid inputs' do
    visit root_path
    click_on 'Sign in with Google'
    visit new_merchandise_path
    fill_in :merchandise_item_name, with:'Sweatshirt'
    fill_in :merchandise_purchase_price, with: 20
    fill_in :merchandise_quantity_on_hand, with: 5
    fill_in :merchandise_sell_price, with: 40
    click_on 'Create Merchandise'
    visit merchandises_path
    click_on 'Edit'
    fill_in :merchandise_sell_price, with: 75
    click_on 'Update Merchandise'
    visit merchandises_path

    expect(page).to have_content('Sweatshirt')
    expect(page).to have_content(20)
    expect(page).to have_content(5)
    expect(page).to have_content(75)
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
