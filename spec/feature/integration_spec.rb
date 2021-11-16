# frozen_string_literal: true

# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating an Encounter', type: :feature do
  Rails.application.env_config['devise.mapping'] = Devise.mappings[:user]
  Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]

  scenario 'valid inputs for new encounter page' do
    visit root_path
    click_on 'Sign in with Google'
    visit new_recruit_path

    fill_in :recruit_uin, with: 727_001_489
    fill_in 'Name', with: 'Nina Rao'
    fill_in 'Email', with: 'ninarao09@tamu.edu'
    fill_in :recruit_phone_number, with: '1234567890'
    fill_in 'Address', with: '100 address'
    page.select('Recruit', from: :recruit_person_type)
    fill_in :recruit_contact_type, with: 'Twitter'
    fill_in :recruit_interest_level, with: 5
    fill_in :recruit_times_contacted, with: 2
    fill_in :recruit_date_contacted, with: '2014-08-06'

    click_on 'Create Recruit'
    visit recruits_path
    click_on 'Encounters'

    visit new_encounter_path
    fill_in 'Notes', with: 'this is a note'
    page.select('Nina Rao', from: :encounter_recruit_id)
    click_on 'Create Encounter'
    visit encounters_path

    expect(page).to have_content('this is a note')
    expect(page).to have_content('Nina Rao')
  end

  scenario 'invalid recruit id' do
    visit root_path
    click_on 'Sign in with Google'
    visit new_recruit_path

    fill_in :recruit_uin, with: 727_001_489
    fill_in 'Name', with: 'Nina Rao'
    fill_in 'Email', with: 'ninarao09@tamu.edu'
    fill_in :recruit_phone_number, with: '1234567890'
    fill_in 'Address', with: '100 address'
    page.select('Recruit', from: :recruit_person_type)
    fill_in :recruit_contact_type, with: 'Twitter'
    fill_in :recruit_interest_level, with: 5
    fill_in :recruit_times_contacted, with: 2
    fill_in :recruit_date_contacted, with: '2014-08-06'

    click_on 'Create Recruit'
    visit recruits_path
    click_on 'Encounters'

    visit new_encounter_path
    fill_in 'Notes', with: 'this is a note'
    click_on 'Create Encounter'
    visit encounters_path

    expect(page).not_to have_content('Nina Rao', count: 1)
  end

  scenario 'invalid notes' do
    visit root_path
    click_on 'Sign in with Google'
    visit new_recruit_path

    fill_in :recruit_uin, with: 727_001_489
    fill_in 'Name', with: 'Nina Rao'
    fill_in 'Email', with: 'ninarao09@tamu.edu'
    fill_in :recruit_phone_number, with: '1234567890'
    fill_in 'Address', with: '100 address'
    page.select('Recruit', from: :recruit_person_type)
    fill_in :recruit_contact_type, with: 'Twitter'
    fill_in :recruit_interest_level, with: 5
    fill_in :recruit_times_contacted, with: 2
    fill_in :recruit_date_contacted, with: '2014-08-06'

    click_on 'Create Recruit'
    visit recruits_path
    click_on 'Encounters'

    visit new_encounter_path
    page.select('Nina Rao', from: :encounter_recruit_id)
    click_on 'Create Encounter'
    visit encounters_path

    expect(page).not_to have_content('this is a note', count: 1)
  end

  scenario 'invalid entries' do
    visit root_path
    click_on 'Sign in with Google'
    visit new_recruit_path

    fill_in :recruit_uin, with: 727_001_489
    fill_in 'Name', with: 'Nina Rao'
    fill_in 'Email', with: 'ninarao09@tamu.edu'
    fill_in :recruit_phone_number, with: '1234567890'
    fill_in 'Address', with: '100 address'
    page.select('Recruit', from: :recruit_person_type)
    fill_in :recruit_contact_type, with: 'Twitter'
    fill_in :recruit_interest_level, with: 5
    fill_in :recruit_times_contacted, with: 2
    fill_in :recruit_date_contacted, with: '2014-08-06'

    click_on 'Create Recruit'
    visit recruits_path
    click_on 'Encounters'

    visit new_encounter_path
    click_on 'Create Encounter'
    visit encounters_path

    expect(page).not_to have_content('Nina Rao', count: 1)
    expect(page).not_to have_content('this is a note', count: 1)
  end
end

RSpec.describe 'Deleting an Encounter', type: :feature do
  Rails.application.env_config['devise.mapping'] = Devise.mappings[:user]
  Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]

  scenario 'delete encounter' do
    visit root_path
    click_on 'Sign in with Google'
    visit new_recruit_path

    fill_in :recruit_uin, with: 727_001_489
    fill_in 'Name', with: 'Nina Rao'
    fill_in 'Email', with: 'ninarao09@tamu.edu'
    fill_in :recruit_phone_number, with: '1234567890'
    fill_in 'Address', with: '100 address'
    page.select('Recruit', from: :recruit_person_type)
    fill_in :recruit_contact_type, with: 'Twitter'
    fill_in :recruit_interest_level, with: 5
    fill_in :recruit_times_contacted, with: 2
    fill_in :recruit_date_contacted, with: '2014-08-06'

    click_on 'Create Recruit'
    visit recruits_path
    click_on 'Encounters'

    visit new_encounter_path
    fill_in 'Notes', with: 'this is a note'
    page.select('Nina Rao', from: :encounter_recruit_id)
    click_on 'Create Encounter'
    visit encounters_path

    click_on 'Delete'
    click_on 'Delete Encounter'
    visit encounters_path

    expect(page).not_to have_content('this is a note')
    expect(page).not_to have_content('Nina Rao', count: 1)
  end
end

RSpec.describe 'Editing an Encounter', type: :feature do
  Rails.application.env_config['devise.mapping'] = Devise.mappings[:user]
  Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]

  scenario 'edit encounter' do
    visit root_path
    click_on 'Sign in with Google'
    visit new_recruit_path

    fill_in :recruit_uin, with: 727_001_489
    fill_in 'Name', with: 'Nina Rao'
    fill_in 'Email', with: 'ninarao09@tamu.edu'
    fill_in :recruit_phone_number, with: '1234567890'
    fill_in 'Address', with: '100 address'
    page.select('Recruit', from: :recruit_person_type)
    fill_in :recruit_contact_type, with: 'Twitter'
    fill_in :recruit_interest_level, with: 5
    fill_in :recruit_times_contacted, with: 2
    fill_in :recruit_date_contacted, with: '2014-08-06'

    click_on 'Create Recruit'
    visit recruits_path
    click_on 'Encounters'

    visit new_encounter_path
    fill_in 'Notes', with: 'this is a note'
    page.select('Nina Rao', from: :encounter_recruit_id)
    click_on 'Create Encounter'
    visit encounters_path

    click_on 'Edit'
    fill_in 'Notes', with: 'this is not a note'
    click_on 'Update Encounter'
    visit encounters_path

    expect(page).to have_content('this is not a note')
    expect(page).to have_content('Nina Rao', count: 1)
  end

  scenario 'invalid edit encounter' do
    visit root_path
    click_on 'Sign in with Google'
    visit new_recruit_path

    fill_in :recruit_uin, with: 727_001_489
    fill_in 'Name', with: 'Nina Rao'
    fill_in 'Email', with: 'ninarao09@tamu.edu'
    fill_in :recruit_phone_number, with: '1234567890'
    fill_in 'Address', with: '100 address'
    page.select('Recruit', from: :recruit_person_type)
    fill_in :recruit_contact_type, with: 'Twitter'
    fill_in :recruit_interest_level, with: 5
    fill_in :recruit_times_contacted, with: 2
    fill_in :recruit_date_contacted, with: '2014-08-06'

    click_on 'Create Recruit'
    visit recruits_path
    click_on 'Encounters'

    visit new_encounter_path
    fill_in 'Notes', with: 'this is a note'
    page.select('Nina Rao', from: :encounter_recruit_id)
    click_on 'Create Encounter'
    visit encounters_path

    click_on 'Edit'
    fill_in 'Notes', with: nil
    click_on 'Update Encounter'
    visit encounters_path

    expect(page).to have_content('this is a note')
    expect(page).to have_content('Nina Rao', count: 1)
  end
end

RSpec.describe 'Creating an Alumni', type: :feature do
  Rails.application.env_config['devise.mapping'] = Devise.mappings[:user]
  Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]

  scenario 'valid inputs for new person page - Player' do
    visit root_path
    click_on 'Sign in with Google'
    visit new_person_path

    fill_in :person_uin, with: 727_001_489
    fill_in 'Name', with: 'Nina Rao'
    fill_in 'Email', with: 'ninarao09@tamu.edu'
    fill_in :person_phone_number, with: '1234567890'
    fill_in 'Address', with: '100 address'
    page.select('Player', from: :person_person_type)
    click_on 'Create Person'
    visit people_path
    expect(page).to have_content(727_001_489)
    expect(page).to have_content('Nina Rao')
    expect(page).to have_content('ninarao09@tamu.edu')
    expect(page).to have_content('1234567890')
    expect(page).to have_content('100 address')
    expect(page).to have_content('Player')
  end

  scenario 'valid inputs for new person page - Alumni' do
    visit root_path
    click_on 'Sign in with Google'
    visit new_person_path

    fill_in :person_uin, with: 727_001_489
    fill_in 'Name', with: 'Nina Rao'
    fill_in 'Email', with: 'ninarao09@tamu.edu'
    fill_in :person_phone_number, with: '1234567890'
    fill_in 'Address', with: '100 address'
    page.select('Alumni', from: :person_person_type)
    click_on 'Create Person'
    visit alumnis_path
    expect(page).to have_content(727_001_489)
    expect(page).to have_content('Nina Rao')
    expect(page).to have_content('ninarao09@tamu.edu')
    expect(page).to have_content('1234567890')
    expect(page).to have_content('100 address')
    expect(page).to have_content('Alumni')
  end

  scenario 'invalid person_id' do
    visit root_path
    click_on 'Sign in with Google'
    visit new_person_path
    fill_in :person_name, with: 'Nina Rao'
    fill_in 'Email', with: 'ninarao09@tamu.edu'
    fill_in :person_phone_number, with: '1234567890'
    fill_in 'Address', with: '100 address'
    page.select('Player', from: :person_person_type)
    click_on 'Create Person'
    visit people_path
    expect(page).not_to have_content(727_001_489, count: 1)
  end

  scenario 'invalid name' do
    visit root_path
    click_on 'Sign in with Google'
    visit new_person_path
    fill_in :person_uin, with: 727_001_489
    fill_in 'Email', with: 'ninarao09@tamu.edu'
    fill_in :person_phone_number, with: '1234567890'
    fill_in 'Address', with: '100 address'
    page.select('Player', from: :person_person_type)
    click_on 'Create Person'
    visit people_path
    expect(page).not_to have_content('Nina Rao', count: 1)
  end

  scenario 'invalid email' do
    visit root_path
    click_on 'Sign in with Google'
    visit new_person_path

    fill_in :person_uin, with: 1
    fill_in 'Name', with: 'Nina Rao'
    fill_in :person_phone_number, with: '1234567890'
    fill_in 'Address', with: '100 address'
    page.select('Player', from: :person_person_type)
    click_on 'Create Person'
    visit people_path
    expect(page).not_to have_content('ninarao09@tamu.edu', count: 1)
  end

  scenario 'invalid phone number' do
    visit root_path
    click_on 'Sign in with Google'
    visit new_person_path
    fill_in :person_uin, with: 727_001_489
    fill_in 'Name', with: 'Nina Rao'
    fill_in 'Email', with: 'ninarao09@tamu.edu'
    fill_in 'Address', with: '100 address'
    page.select('Player', from: :person_person_type)
    click_on 'Create Person'
    visit people_path
    expect(page).not_to have_content('1234567890', count: 1)
  end

  scenario 'invalid address' do
    visit root_path
    click_on 'Sign in with Google'
    visit new_person_path
    fill_in :person_uin, with: 727_001_489
    fill_in 'Name', with: 'Nina Rao'
    fill_in 'Email', with: 'ninarao09@tamu.edu'
    fill_in :person_phone_number, with: '1234567890'
    page.select('Player', from: :person_person_type)
    click_on 'Create Person'
    visit people_path
    expect(page).not_to have_content('100 address', count: 1)
  end

  scenario 'invalid person type' do
    visit root_path
    click_on 'Sign in with Google'
    visit new_person_path
    fill_in :person_uin, with: 727_001_489
    fill_in 'Name', with: 'Nina Rao'
    fill_in 'Email', with: 'ninarao09@tamu.edu'
    fill_in :person_phone_number, with: '1234567890'
    fill_in 'Address', with: '100 address'
    click_on 'Create Person'
    visit people_path
    expect(page).not_to have_content('Player', count: 2)
  end
end

RSpec.describe 'Deleting a Person', type: :feature do
  Rails.application.env_config['devise.mapping'] = Devise.mappings[:user]
  Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]

  scenario 'Clicking the button' do
    visit root_path
    click_on 'Sign in with Google'
    visit new_person_path

    fill_in :person_uin, with: 727_001_489
    fill_in 'Name', with: 'Nina Rao'
    fill_in 'Email', with: 'ninarao09@tamu.edu'
    fill_in :person_phone_number, with: '1234567890'
    fill_in 'Address', with: '100 address'
    page.select('Player', from: :person_person_type)
    click_on 'Create Person'
    visit people_path

    click_on 'Delete'
    click_on 'Delete Person'
    visit people_path

    expect(page).not_to have_content(727_001_489)
    expect(page).not_to have_content('Nina Rao')
    expect(page).not_to have_content('ninarao09@tamu.edu')
    expect(page).not_to have_content('1234567890')
    expect(page).not_to have_content('100 address')
  end
end

RSpec.describe 'Editing a Person', type: :feature do
  Rails.application.env_config['devise.mapping'] = Devise.mappings[:user]
  Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]

  scenario 'valid inputs' do
    visit root_path
    click_on 'Sign in with Google'
    visit new_person_path

    fill_in :person_uin, with: 727_001_489
    fill_in 'Name', with: 'Nina Rao'
    fill_in 'Email', with: 'ninarao09@tamu.edu'
    fill_in :person_phone_number, with: '1234567890'
    fill_in 'Address', with: '100 address'
    page.select('Player', from: :person_person_type)
    click_on 'Create Person'
    visit people_path

    click_on 'Edit'
    fill_in :person_uin, with: 727_000_000
    click_on 'Update Person'
    visit people_path

    expect(page).to have_content(727_000_000)
    expect(page).to have_content('Nina Rao')
    expect(page).to have_content('ninarao09@tamu.edu')
    expect(page).to have_content('1234567890')
    expect(page).to have_content('100 address')
    expect(page).to have_content('Player')
  end

  scenario 'invalid inputs' do
    visit root_path
    click_on 'Sign in with Google'
    visit new_person_path

    fill_in :person_uin, with: 727_001_489
    fill_in 'Name', with: 'Nina Rao'
    fill_in 'Email', with: 'ninarao09@tamu.edu'
    fill_in :person_phone_number, with: '1234567890'
    fill_in 'Address', with: '100 address'
    page.select('Player', from: :person_person_type)
    click_on 'Create Person'
    visit people_path

    click_on 'Edit'
    fill_in :person_uin, with: nil
    click_on 'Update Person'
    visit people_path

    expect(page).to have_content(727_001_489)
    expect(page).to have_content('Nina Rao')
    expect(page).to have_content('ninarao09@tamu.edu')
    expect(page).to have_content('1234567890')
    expect(page).to have_content('100 address')
    expect(page).to have_content('Player')
  end
end

RSpec.describe 'Creating an Player', type: :feature do
  Rails.application.env_config['devise.mapping'] = Devise.mappings[:user]
  Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]

  scenario 'valid inputs for new player page' do
    visit root_path
    click_on 'Sign in with Google'
    visit new_player_path

    fill_in :player_uin, with: 727_001_489
    fill_in 'Name', with: 'Nina Rao'
    fill_in 'Email', with: 'ninarao09@tamu.edu'
    fill_in :player_phone_number, with: '1234567890'
    fill_in 'Address', with: '100 address'
    page.select('Player', from: :player_person_type)
    fill_in 'Dues', with: 120
    page.select('Active', from: :player_status)

    click_on 'Create Player'
    visit players_path
    expect(page).to have_content(727_001_489)
    expect(page).to have_content('Nina Rao')
    expect(page).to have_content('ninarao09@tamu.edu')
    expect(page).to have_content('1234567890')
    expect(page).to have_content('100 address')
    expect(page).to have_content('Player')
    expect(page).to have_content(120)
    expect(page).to have_content('Active')
  end

  scenario 'invalid inputs for new player page' do
    visit root_path
    click_on 'Sign in with Google'
    visit new_player_path

    fill_in :player_uin, with: nil
    fill_in 'Name', with: nil
    fill_in 'Email', with: 'ninarao09@tamu.edu'
    fill_in :player_phone_number, with: nil
    fill_in 'Address', with: nil
    page.select('Player', from: :player_person_type)
    fill_in 'Dues', with: nil
    page.select('Active', from: :player_status)

    click_on 'Create Player'
    visit players_path
    expect(page).not_to have_content(727_001_489)
    expect(page).not_to have_content('Nina Rao')
    expect(page).not_to have_content('ninarao09@tamu.edu')
    expect(page).not_to have_content('1234567890')
    expect(page).not_to have_content('100 address')
    expect(page).not_to have_content('Player', count: 2)
    expect(page).not_to have_content(120)
    expect(page).not_to have_content('Active')
  end
end

RSpec.describe 'Deleting an Player', type: :feature do
  Rails.application.env_config['devise.mapping'] = Devise.mappings[:user]
  Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]

  scenario 'Clicking the button' do
    visit root_path
    click_on 'Sign in with Google'
    visit new_player_path

    fill_in :player_uin, with: 727_001_489
    fill_in 'Name', with: 'Nina Rao'
    fill_in 'Email', with: 'ninarao09@tamu.edu'
    fill_in :player_phone_number, with: '1234567890'
    fill_in 'Address', with: '100 address'
    page.select('Player', from: :player_person_type)
    fill_in 'Dues', with: 120
    page.select('Active', from: :player_status)
    click_on 'Create Player'
    visit players_path

    click_on 'Delete'
    click_on 'Delete Player'
    visit players_path

    expect(page).not_to have_content(727_001_489)
    expect(page).not_to have_content('Nina Rao')
    expect(page).not_to have_content('ninarao09@tamu.edu')
    expect(page).not_to have_content('1234567890')
    expect(page).not_to have_content('100 address')
    expect(page).not_to have_content('Player', count: 2)
    expect(page).not_to have_content(120)
    expect(page).not_to have_content('Active')
  end
end

RSpec.describe 'Editing an Player', type: :feature do
  Rails.application.env_config['devise.mapping'] = Devise.mappings[:user]
  Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]

  scenario 'valid inputs for edit player page' do
    visit root_path
    click_on 'Sign in with Google'
    visit new_player_path

    fill_in :player_uin, with: 727_001_489
    fill_in 'Name', with: 'Nina Rao'
    fill_in 'Email', with: 'ninarao09@tamu.edu'
    fill_in :player_phone_number, with: '1234567890'
    fill_in 'Address', with: '100 address'
    page.select('Player', from: :player_person_type)
    fill_in 'Dues', with: 120
    page.select('Active', from: :player_status)

    click_on 'Create Player'
    visit players_path

    click_on 'Edit'
    fill_in :player_uin, with: 727_000_000
    click_on 'Update Player'
    visit players_path

    expect(page).to have_content(727_000_000)
    expect(page).to have_content('Nina Rao')
    expect(page).to have_content('ninarao09@tamu.edu')
    expect(page).to have_content('1234567890')
    expect(page).to have_content('100 address')
    expect(page).to have_content('Player')
    expect(page).to have_content(120)
    expect(page).to have_content('Active')
  end

  scenario 'invalid inputs for edit player page' do
    visit root_path
    click_on 'Sign in with Google'
    visit new_player_path

    fill_in :player_uin, with: 727_001_489
    fill_in 'Name', with: 'Nina Rao'
    fill_in 'Email', with: 'ninarao09@tamu.edu'
    fill_in :player_phone_number, with: '1234567890'
    fill_in 'Address', with: '100 address'
    page.select('Player', from: :player_person_type)
    fill_in 'Dues', with: 120
    page.select('Active', from: :player_status)

    click_on 'Create Player'
    visit players_path

    click_on 'Edit'
    fill_in :player_uin, with: nil
    click_on 'Update Player'
    visit players_path

    expect(page).to have_content(727_001_489)
    expect(page).to have_content('Nina Rao')
    expect(page).to have_content('ninarao09@tamu.edu')
    expect(page).to have_content('1234567890')
    expect(page).to have_content('100 address')
    expect(page).to have_content('Player')
    expect(page).to have_content(120)
    expect(page).to have_content('Active')
  end
end

RSpec.describe 'Creating a Merch', type: :feature do
  Rails.application.env_config['devise.mapping'] = Devise.mappings[:user]
  Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]

  scenario 'valid inputs' do
    visit root_path
    click_on 'Sign in with Google'
    visit new_merchandise_path
    fill_in :merchandise_item_name, with: 'Sweatshirt'
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

RSpec.describe 'Deleting a Merch', type: :feature do
  Rails.application.env_config['devise.mapping'] = Devise.mappings[:user]
  Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]

  scenario 'Clicking the button' do
    visit root_path
    click_on 'Sign in with Google'
    visit new_merchandise_path
    fill_in :merchandise_item_name, with: 'Sweatshirt'
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

RSpec.describe 'Editing a Merchandise', type: :feature do
  Rails.application.env_config['devise.mapping'] = Devise.mappings[:user]
  Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]

  scenario 'valid inputs' do
    visit root_path
    click_on 'Sign in with Google'
    visit new_merchandise_path
    fill_in :merchandise_item_name, with: 'Sweatshirt'
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

  scenario 'invalid inputs' do
    visit root_path
    click_on 'Sign in with Google'
    visit new_merchandise_path
    fill_in :merchandise_item_name, with: 'Sweatshirt'
    fill_in :merchandise_purchase_price, with: 20
    fill_in :merchandise_quantity_on_hand, with: 5
    fill_in :merchandise_sell_price, with: 40
    click_on 'Create Merchandise'
    visit merchandises_path
    click_on 'Edit'
    fill_in :merchandise_sell_price, with: nil
    click_on 'Update Merchandise'
    visit merchandises_path

    expect(page).to have_content('Sweatshirt')
    expect(page).to have_content(20)
    expect(page).to have_content(5)
    expect(page).to have_content(40)
  end
end

RSpec.describe 'Creating an Recruit', type: :feature do
  Rails.application.env_config['devise.mapping'] = Devise.mappings[:user]
  Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]

  scenario 'valid inputs for new recruit page' do
    visit root_path
    click_on 'Sign in with Google'
    visit new_recruit_path

    fill_in :recruit_uin, with: 727_001_489
    fill_in 'Name', with: 'Nina Rao'
    fill_in 'Email', with: 'ninarao09@tamu.edu'
    fill_in :recruit_phone_number, with: '1234567890'
    fill_in 'Address', with: '100 address'
    page.select('Recruit', from: :recruit_person_type)
    fill_in :recruit_contact_type, with: 'Twitter'
    fill_in :recruit_interest_level, with: 5
    fill_in :recruit_times_contacted, with: 2
    fill_in :recruit_date_contacted, with: '2014-08-06'

    click_on 'Create Recruit'
    visit recruits_path
    expect(page).to have_content(727_001_489)
    expect(page).to have_content('Nina Rao')
    expect(page).to have_content('ninarao09@tamu.edu')
    expect(page).to have_content('1234567890')
    expect(page).to have_content('100 address')
    expect(page).to have_content('Player')
    expect(page).to have_content(5)
    expect(page).to have_content(2)
    expect(page).to have_content('2014-08-06')
  end

  scenario 'invalid inputs for new recruit page' do
    visit root_path
    click_on 'Sign in with Google'
    visit new_recruit_path

    fill_in :recruit_uin, with: nil
    fill_in 'Name', with: nil
    fill_in 'Email', with: 'ninarao09@tamu.edu'
    fill_in :recruit_phone_number, with: nil
    fill_in 'Address', with: nil
    page.select('Player', from: :recruit_person_type)
    fill_in :recruit_interest_level, with: nil
    fill_in :recruit_times_contacted, with: nil
    fill_in :recruit_date_contacted, with: '2014-08-06'

    click_on 'Create Recruit'
    visit recruits_path
    expect(page).not_to have_content(727_001_489)
    expect(page).not_to have_content('Nina Rao')
    expect(page).not_to have_content('ninarao09@tamu.edu')
    expect(page).not_to have_content('1234567890')
    expect(page).not_to have_content('100 address')
    expect(page).not_to have_content('Player', count: 2)
    expect(page).not_to have_content(5)
    expect(page).not_to have_content(2)
    expect(page).not_to have_content('2014-08-06')
  end
end

RSpec.describe 'Deleting an Recruit', type: :feature do
  Rails.application.env_config['devise.mapping'] = Devise.mappings[:user]
  Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]

  scenario 'Clicking the button' do
    visit root_path
    click_on 'Sign in with Google'
    visit new_recruit_path

    fill_in :recruit_uin, with: 727_001_489
    fill_in 'Name', with: 'Nina Rao'
    fill_in 'Email', with: 'ninarao09@tamu.edu'
    fill_in :recruit_phone_number, with: '1234567890'
    fill_in 'Address', with: '100 address'
    page.select('Recruit', from: :recruit_person_type)
    fill_in :recruit_contact_type, with: 'Twitter'
    fill_in :recruit_interest_level, with: 5
    fill_in :recruit_times_contacted, with: 2
    fill_in :recruit_date_contacted, with: '2014-08-06'

    click_on 'Create Recruit'
    visit recruits_path

    click_on 'Delete'
    click_on 'Delete Recruit'
    visit recruits_path

    expect(page).not_to have_content(727_001_489)
    expect(page).not_to have_content('Nina Rao')
    expect(page).not_to have_content('ninarao09@tamu.edu')
    expect(page).not_to have_content('1234567890')
    expect(page).not_to have_content('100 address')
    expect(page).not_to have_content('Player', count: 2)
    expect(page).not_to have_content(5)
    expect(page).not_to have_content(2)
    expect(page).not_to have_content('2014-08-06')
  end
end

RSpec.describe 'Editing an Recruit', type: :feature do
  Rails.application.env_config['devise.mapping'] = Devise.mappings[:user]
  Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]

  scenario '- valid inputs' do
    visit root_path
    click_on 'Sign in with Google'
    visit new_recruit_path

    fill_in :recruit_uin, with: 727_001_489
    fill_in 'Name', with: 'Nina Rao'
    fill_in 'Email', with: 'ninarao09@tamu.edu'
    fill_in :recruit_phone_number, with: '1234567890'
    fill_in 'Address', with: '100 address'
    page.select('Recruit', from: :recruit_person_type)
    fill_in :recruit_contact_type, with: 'Twitter'
    fill_in :recruit_interest_level, with: 5
    fill_in :recruit_times_contacted, with: 2
    fill_in :recruit_date_contacted, with: '2014-08-06'

    click_on 'Create Recruit'
    visit recruits_path

    click_on 'Edit'
    fill_in :recruit_uin, with: 727_000_000
    click_on 'Update Recruit'
    visit recruits_path

    expect(page).to have_content(727_000_000)
    expect(page).to have_content('Nina Rao')
    expect(page).to have_content('ninarao09@tamu.edu')
    expect(page).to have_content('1234567890')
    expect(page).to have_content('100 address')
    expect(page).to have_content('Recruit', count: 4)
    expect(page).to have_content(5)
    expect(page).to have_content(2)
    expect(page).to have_content('2014-08-06')
  end

  scenario '- invalid inputs' do
    visit root_path
    click_on 'Sign in with Google'
    visit new_recruit_path

    fill_in :recruit_uin, with: 727_001_489
    fill_in 'Name', with: 'Nina Rao'
    fill_in 'Email', with: 'ninarao09@tamu.edu'
    fill_in :recruit_phone_number, with: '1234567890'
    fill_in 'Address', with: '100 address'
    page.select('Recruit', from: :recruit_person_type)
    fill_in :recruit_contact_type, with: 'Twitter'
    fill_in :recruit_interest_level, with: 5
    fill_in :recruit_times_contacted, with: 2
    fill_in :recruit_date_contacted, with: '2014-08-06'

    click_on 'Create Recruit'
    visit recruits_path

    click_on 'Edit'
    fill_in :recruit_uin, with: nil
    click_on 'Update Recruit'
    visit recruits_path

    expect(page).not_to have_content(727_000_000)
    expect(page).to have_content('Nina Rao')
    expect(page).to have_content('ninarao09@tamu.edu')
    expect(page).to have_content('1234567890')
    expect(page).to have_content('100 address')
    expect(page).to have_content('Recruit', count: 4)
    expect(page).to have_content(5)
    expect(page).to have_content(2)
    expect(page).to have_content('2014-08-06')
  end
end

RSpec.describe 'Creating an Event', type: :feature do
  Rails.application.env_config['devise.mapping'] = Devise.mappings[:user]
  Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]

  scenario 'valid inputs for new event page' do
    visit root_path
    click_on 'Sign in with Google'
    visit new_event_path
    fill_in 'event_name', with: 'Practice 1'
    fill_in 'event_info', with: 'First practice of the season'
    fill_in 'event_date', with: '2021-03-09'
    fill_in 'event_time', with: '2000-01-01 16:37:00 UTC'
    page.select('Game', from: :event_event_type)
    fill_in 'event_address', with: 'test'
    page.select('7s', from: :event_season)
    fill_in 'event_score', with: '24-0'
    click_on 'Create Event'
    visit events_path
    expect(page).to have_content('Practice 1')
    expect(page).to have_content('First practice of the season')
    expect(page).to have_content('2021-03-09')
    expect(page).to have_content('2000-01-01 16:37:00 UTC')
    expect(page).to have_content('Game')
    expect(page).to have_content('7s')
    expect(page).to have_content('24-0')
  end

  scenario 'invalid name' do
    visit root_path
    click_on 'Sign in with Google'
    visit new_event_path

    fill_in 'event_info', with: 'First practice of the season'
    fill_in 'event_date', with: '2021-03-09'
    fill_in 'event_time', with: '2000-01-01 16:37:00 UTC'
    page.select('Game', from: :event_event_type)
    fill_in 'event_address', with: 'test'
    page.select('7s', from: :event_season)
    fill_in 'event_score', with: '24-0'
    click_on 'Create Event'
    visit events_path
    expect(page).not_to have_content('Practice 1', count: 1)
  end
  scenario 'invalid info' do
    visit root_path
    click_on 'Sign in with Google'
    visit new_event_path

    fill_in 'Name', with: 'Practice 1'
    fill_in 'event_date', with: '2021-03-09'
    fill_in 'event_time', with: '2000-01-01 16:37:00 UTC'
    page.select('Game', from: :event_event_type)
    fill_in 'event_address', with: 'test'
    page.select('7s', from: :event_season)
    fill_in 'event_score', with: '24-0'
    click_on 'Create Event'
    visit events_path
    expect(page).not_to have_content('First practice of the season', count: 1)
  end
  scenario 'invalid date' do
    visit root_path
    click_on 'Sign in with Google'
    visit new_event_path

    fill_in 'Name', with: 'Practice 1'
    fill_in 'event_info', with: 'First practice of the season'
    fill_in 'event_time', with: '2000-01-01 16:37:00 UTC'
    page.select('Game', from: :event_event_type)
    fill_in 'event_address', with: 'test'
    page.select('7s', from: :event_season)
    fill_in 'event_score', with: '24-0'
    click_on 'Create Event'
    visit events_path
    expect(page).not_to have_content('2021-03-09', count: 1)
  end
  scenario 'invalid time' do
    visit root_path
    click_on 'Sign in with Google'
    visit new_event_path

    fill_in 'Name', with: 'Practice 1'
    fill_in 'event_info', with: 'First practice of the season'
    fill_in 'event_date', with: '2021-03-09'
    page.select('Game', from: :event_event_type)
    fill_in 'event_address', with: 'test'
    page.select('7s', from: :event_season)
    fill_in 'event_score', with: '24-0'
    click_on 'Create Event'
    visit events_path
    expect(page).not_to have_content('2000-01-01 16:37:00 UTC', count: 1)
  end
  scenario 'invalid event_type' do
    visit root_path
    click_on 'Sign in with Google'
    visit new_event_path

    fill_in 'Name', with: 'Practice 1'
    fill_in 'event_info', with: 'First practice of the season'
    fill_in 'event_date', with: '2021-03-09'
    fill_in 'event_time', with: '2000-01-01 16:37:00 UTC'
    fill_in 'event_address', with: 'test'
    page.select('7s', from: :event_season)
    fill_in 'event_score', with: '24-0'
    click_on 'Create Event'
    visit events_path
    expect(page).not_to have_content('Tournament', count: 1)
  end
  scenario 'invalid address' do
    visit root_path
    click_on 'Sign in with Google'
    visit new_event_path

    fill_in 'Name', with: 'Practice 1'
    fill_in 'event_info', with: 'First practice of the season'
    fill_in 'event_date', with: '2021-03-09'
    fill_in 'event_time', with: '2000-01-01 16:37:00 UTC'
    page.select('Game', from: :event_event_type)
    page.select('7s', from: :event_season)
    fill_in 'event_score', with: '24-0'
    click_on 'Create Event'
    visit events_path
    expect(page).not_to have_content('test', count: 1)
  end
  scenario 'invalid event_season' do
    visit root_path
    click_on 'Sign in with Google'
    visit new_event_path

    fill_in 'Name', with: 'Practice 1'
    fill_in 'event_info', with: 'First practice of the season'
    fill_in 'event_date', with: '2021-03-09'
    fill_in 'event_time', with: '2000-01-01 16:37:00 UTC'
    page.select('Game', from: :event_event_type)
    fill_in 'event_address', with: 'test'
    fill_in 'event_score', with: '24-0'
    click_on 'Create Event'
    visit events_path
    expect(page).not_to have_content('15s', count: 1)
  end
  scenario 'invalid score' do
    visit root_path
    click_on 'Sign in with Google'
    visit new_event_path

    fill_in 'Name', with: 'Practice 1'
    fill_in 'event_info', with: 'First practice of the season'
    fill_in 'event_date', with: '2021-03-09'
    fill_in 'event_time', with: '2000-01-01 16:37:00 UTC'
    page.select('Game', from: :event_event_type)
    fill_in 'event_address', with: 'test'
    page.select('7s', from: :event_season)
    click_on 'Create Event'
    visit events_path
    expect(page).not_to have_content('24-0', count: 1)
  end
end

RSpec.describe 'Editing an Event', type: :feature do
  Rails.application.env_config['devise.mapping'] = Devise.mappings[:user]
  Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]

  scenario 'valid inputs' do
    visit root_path
    click_on 'Sign in with Google'
    visit new_event_path

    fill_in 'Name', with: 'Practice 1'
    fill_in 'event_info', with: 'First practice of the season'
    fill_in 'event_date', with: '2021-03-09'
    fill_in 'event_time', with: '2000-01-01 16:37:00 UTC'
    page.select('Game', from: :event_event_type)
    fill_in 'event_address', with: 'test'
    page.select('7s', from: :event_season)
    fill_in 'event_score', with: '24-0'
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
    expect(page).to have_content('Game')
    expect(page).to have_content('7s')
    expect(page).to have_content('24-0')
  end

  scenario 'invalid inputs' do
    visit root_path
    click_on 'Sign in with Google'
    visit new_event_path

    fill_in 'Name', with: 'Practice 1'
    fill_in 'event_info', with: 'First practice of the season'
    fill_in 'Date', with: '2021-03-09'
    fill_in 'Time', with: '2000-01-01 16:37:00 UTC'
    page.select('Game', from: :event_event_type)
    fill_in 'event_address', with: 'test'
    page.select('7s', from: :event_season)
    fill_in 'event_score', with: '24-0'
    click_on 'Create Event'
    visit events_path

    click_on 'Edit'
    fill_in 'Date', with: nil
    click_on 'Update Event'
    visit events_path
    expect(page).to have_content('Practice 1')
    expect(page).to have_content('First practice of the season')
    expect(page).to have_content('2021-03-09')
    expect(page).to have_content('2000-01-01 16:37:00 UTC')
    expect(page).to have_content('Game')
    expect(page).to have_content('7s')
    expect(page).to have_content('24-0')
  end
end

RSpec.describe 'Deleting an event', type: :feature do
  Rails.application.env_config['devise.mapping'] = Devise.mappings[:user]
  Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]

  scenario 'Clicking the button' do
    visit root_path
    click_on 'Sign in with Google'
    visit new_event_path

    fill_in 'Name', with: 'Practice 1'
    fill_in 'event_info', with: 'First practice of the season'
    fill_in 'event_date', with: '2021-03-09'
    fill_in 'event_time', with: '2000-01-01 16:37:00 UTC'
    page.select('Game', from: :event_event_type)
    fill_in 'event_address', with: 'test'
    page.select('7s', from: :event_season)
    fill_in 'event_score', with: '24-0'
    click_on 'Create Event'
    visit events_path

    click_on 'Delete'
    click_on 'Delete Event'
    visit events_path

    expect(page).not_to have_content('Practice 1')
    expect(page).not_to have_content('First practice of the season')
    expect(page).not_to have_content('2021-03-09')
    expect(page).not_to have_content('2000-01-01 16:37:00 UTC')
    expect(page).not_to have_content('Game')
    expect(page).not_to have_content('test')
    expect(page).not_to have_content('24-0')
  end
end

RSpec.describe 'Create a transaction', type: :feature do
  Rails.application.env_config['devise.mapping'] = Devise.mappings[:user]
  Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]

  scenario 'valid inputs for a transaction' do
    visit root_path
    click_on 'Sign in with Google'
    visit new_player_path

    fill_in :player_uin, with: 727_001_489
    fill_in 'Name', with: 'Nina Rao'
    fill_in 'Email', with: 'ninarao09@tamu.edu'
    fill_in :player_phone_number, with: '1234567890'
    fill_in 'Address', with: '100 address'
    page.select('Player', from: :player_person_type)
    fill_in 'Dues', with: 120
    page.select('Active', from: :player_status)

    click_on 'Create Player'

    visit new_merchandise_path
    fill_in :merchandise_item_name, with: 'Sweatshirt'
    fill_in :merchandise_purchase_price, with: 20
    fill_in :merchandise_quantity_on_hand, with: 5
    fill_in :merchandise_sell_price, with: 40
    click_on 'Create Merchandise'

    visit new_transaction_path
    select '2021', from: 'transaction_transaction_date_1i'
    select 'September', from: 'transaction_transaction_date_2i'
    select '30', from: 'transaction_transaction_date_3i'
    fill_in 'transaction_amount', with: 40
    select 'Sweatshirt', from: 'transaction_merchandise_id'
    select 'Nina Rao', from: 'transaction_person_id'
    click_on 'Create Transaction'
    visit transactions_path
    expect(page).to have_content(40)
    expect(page).to have_content('2021-09-30')
  end

  scenario 'invalid inputs for a transaction' do
    visit root_path
    click_on 'Sign in with Google'
    visit new_player_path

    fill_in :player_uin, with: 727_001_489
    fill_in 'Name', with: 'Nina Rao'
    fill_in 'Email', with: 'ninarao09@tamu.edu'
    fill_in :player_phone_number, with: '1234567890'
    fill_in 'Address', with: '100 address'
    page.select('Player', from: :player_person_type)
    fill_in 'Dues', with: 120
    page.select('Active', from: :player_status)

    click_on 'Create Player'

    visit new_merchandise_path
    fill_in :merchandise_item_name, with: 'Sweatshirt'
    fill_in :merchandise_purchase_price, with: 20
    fill_in :merchandise_quantity_on_hand, with: 5
    fill_in :merchandise_sell_price, with: 40
    click_on 'Create Merchandise'

    visit new_transaction_path
    select '2021', from: 'transaction_transaction_date_1i'
    select 'September', from: 'transaction_transaction_date_2i'
    select '30', from: 'transaction_transaction_date_3i'
    select 'Sweatshirt', from: 'transaction_merchandise_id'
    select 'Nina Rao', from: 'transaction_person_id'
    click_on 'Create Transaction'
    visit transactions_path
    expect(page).not_to have_content(40)
    expect(page).not_to have_content('2021-09-30')
  end
end

RSpec.describe 'Delete a transaction', type: :feature do
  Rails.application.env_config['devise.mapping'] = Devise.mappings[:user]
  Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]

  scenario 'Delete the transaction' do
    visit root_path
    click_on 'Sign in with Google'
    visit new_player_path

    fill_in :player_uin, with: 727_001_489
    fill_in 'Name', with: 'Nina Rao'
    fill_in 'Email', with: 'ninarao09@tamu.edu'
    fill_in :player_phone_number, with: '1234567890'
    fill_in 'Address', with: '100 address'
    page.select('Player', from: :player_person_type)
    fill_in 'Dues', with: 120
    page.select('Active', from: :player_status)

    click_on 'Create Player'

    visit new_merchandise_path
    fill_in :merchandise_item_name, with: 'Sweatshirt'
    fill_in :merchandise_purchase_price, with: 20
    fill_in :merchandise_quantity_on_hand, with: 5
    fill_in :merchandise_sell_price, with: 40
    click_on 'Create Merchandise'

    visit new_transaction_path
    select '2021', from: 'transaction_transaction_date_1i'
    select 'September', from: 'transaction_transaction_date_2i'
    select '30', from: 'transaction_transaction_date_3i'
    fill_in 'transaction_amount', with: 40
    select 'Sweatshirt', from: 'transaction_merchandise_id'
    select 'Nina Rao', from: 'transaction_person_id'
    click_on 'Create Transaction'
    visit transactions_path
    click_on 'Delete'
    click_on 'Delete Person'
    visit transactions_path
    expect(page).not_to have_content(40)
    expect(page).not_to have_content('2021-09-30')
  end
end

RSpec.describe 'Update a transaction', type: :feature do
  Rails.application.env_config['devise.mapping'] = Devise.mappings[:user]
  Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]

  scenario 'Edit the transaction with valid inputs' do
    visit root_path
    click_on 'Sign in with Google'
    visit new_player_path

    fill_in :player_uin, with: 727_001_489
    fill_in 'Name', with: 'Nina Rao'
    fill_in 'Email', with: 'ninarao09@tamu.edu'
    fill_in :player_phone_number, with: '1234567890'
    fill_in 'Address', with: '100 address'
    page.select('Player', from: :player_person_type)
    fill_in 'Dues', with: 120
    page.select('Active', from: :player_status)

    click_on 'Create Player'

    visit new_merchandise_path
    fill_in :merchandise_item_name, with: 'Sweatshirt'
    fill_in :merchandise_purchase_price, with: 20
    fill_in :merchandise_quantity_on_hand, with: 5
    fill_in :merchandise_sell_price, with: 40
    click_on 'Create Merchandise'

    visit new_transaction_path
    select '2021', from: 'transaction_transaction_date_1i'
    select 'September', from: 'transaction_transaction_date_2i'
    select '30', from: 'transaction_transaction_date_3i'
    fill_in 'transaction_amount', with: 40
    select 'Sweatshirt', from: 'transaction_merchandise_id'
    select 'Nina Rao', from: 'transaction_person_id'
    click_on 'Create Transaction'
    visit transactions_path
    click_on 'Edit'
    fill_in 'transaction_amount', with: 99
    click_on 'Update Transaction'
    visit transactions_path
    expect(page).to have_content(99)
    expect(page).to have_content('2021-09-30')
  end

  scenario 'Edit the transaction with invalid inputs' do
    visit root_path
    click_on 'Sign in with Google'
    visit new_player_path

    fill_in :player_uin, with: 727_001_489
    fill_in 'Name', with: 'Nina Rao'
    fill_in 'Email', with: 'ninarao09@tamu.edu'
    fill_in :player_phone_number, with: '1234567890'
    fill_in 'Address', with: '100 address'
    page.select('Player', from: :player_person_type)
    fill_in 'Dues', with: 120
    page.select('Active', from: :player_status)

    click_on 'Create Player'

    visit new_merchandise_path
    fill_in :merchandise_item_name, with: 'Sweatshirt'
    fill_in :merchandise_purchase_price, with: 20
    fill_in :merchandise_quantity_on_hand, with: 5
    fill_in :merchandise_sell_price, with: 40
    click_on 'Create Merchandise'

    visit new_transaction_path
    select '2021', from: 'transaction_transaction_date_1i'
    select 'September', from: 'transaction_transaction_date_2i'
    select '30', from: 'transaction_transaction_date_3i'
    fill_in 'transaction_amount', with: 40
    select 'Sweatshirt', from: 'transaction_merchandise_id'
    select 'Nina Rao', from: 'transaction_person_id'
    click_on 'Create Transaction'
    visit transactions_path
    click_on 'Edit'
    fill_in 'transaction_amount', with: ''
    click_on 'Update Transaction'
    visit transactions_path
    expect(page).not_to have_content(99)
  end
end

RSpec.describe 'Creating an Attendance Record', type: :feature do
  Rails.application.env_config['devise.mapping'] = Devise.mappings[:user]
  Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]

  scenario 'valid inputs for new attendance record' do
    visit root_path
    click_on 'Sign in with Google'
    visit new_player_path

    fill_in :player_uin, with: 727_001_489
    fill_in 'Name', with: 'Nina Rao'
    fill_in 'Email', with: 'ninarao09@tamu.edu'
    fill_in :player_phone_number, with: '1234567890'
    fill_in 'Address', with: '100 address'
    page.select('Player', from: :player_person_type)
    fill_in 'Dues', with: 120
    page.select('Active', from: :player_status)

    click_on 'Create Player'

    visit root_path
    visit new_event_path
    fill_in 'event_name', with: 'Practice 1'
    fill_in 'event_info', with: 'First practice of the season'
    fill_in 'event_date', with: '2021-03-09'
    fill_in 'event_time', with: '2000-01-01 16:37:00 UTC'
    page.select('Game', from: :event_event_type)
    fill_in 'event_address', with: 'test'
    page.select('7s', from: :event_season)
    fill_in 'event_score', with: '24-0'

    click_on 'Create Event'
    visit events_path
    click_on 'Attendance Record'
    click_on 'New Attendance Record'

    page.select('Nina Rao', from: :attendancerecord_player_id)
    page.select('Present', from: :attendancerecord_attendancetype)
    fill_in :attendancerecord_note, with: 'n/a'

    click_on 'Set Attendance Record'
    # visit event_attendancerecords_path
    expect(page).to have_content('Nina Rao')
    expect(page).to have_content('Present')
    expect(page).to have_content('n/a')
  end

  scenario 'invalid inputs for new attendance record' do
    visit root_path
    click_on 'Sign in with Google'
    visit new_player_path

    fill_in :player_uin, with: 727_001_489
    fill_in 'Name', with: 'Nina Rao'
    fill_in 'Email', with: 'ninarao09@tamu.edu'
    fill_in :player_phone_number, with: '1234567890'
    fill_in 'Address', with: '100 address'
    page.select('Player', from: :player_person_type)
    fill_in 'Dues', with: 120
    page.select('Active', from: :player_status)

    click_on 'Create Player'

    visit root_path
    visit new_event_path
    fill_in 'event_name', with: 'Practice 1'
    fill_in 'event_info', with: 'First practice of the season'
    fill_in 'event_date', with: '2021-03-09'
    fill_in 'event_time', with: '2000-01-01 16:37:00 UTC'
    page.select('Game', from: :event_event_type)
    fill_in 'event_address', with: 'test'
    page.select('7s', from: :event_season)
    fill_in 'event_score', with: '24-0'

    click_on 'Create Event'
    visit events_path
    click_on 'Attendance Record'
    click_on 'New Attendance Record'

    fill_in :attendancerecord_note, with: 'n/a'

    click_on 'Set Attendance Record'
    click_on 'Back'
    expect(page).not_to have_content('Nina Rao')
    expect(page).not_to have_content('Present')
    expect(page).not_to have_content('n/a')
  end
end

RSpec.describe 'Deleting an Attendance Record', type: :feature do
  Rails.application.env_config['devise.mapping'] = Devise.mappings[:user]
  Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]

  scenario 'Clicking the button' do
    visit root_path
    click_on 'Sign in with Google'
    visit new_player_path

    fill_in :player_uin, with: 727_001_489
    fill_in 'Name', with: 'Nina Rao'
    fill_in 'Email', with: 'ninarao09@tamu.edu'
    fill_in :player_phone_number, with: '1234567890'
    fill_in 'Address', with: '100 address'
    page.select('Player', from: :player_person_type)
    fill_in 'Dues', with: 120
    page.select('Active', from: :player_status)

    click_on 'Create Player'

    visit root_path
    visit new_event_path
    fill_in 'event_name', with: 'Practice 1'
    fill_in 'event_info', with: 'First practice of the season'
    fill_in 'event_date', with: '2021-03-09'
    fill_in 'event_time', with: '2000-01-01 16:37:00 UTC'
    page.select('Game', from: :event_event_type)
    fill_in 'event_address', with: 'test'
    page.select('7s', from: :event_season)
    fill_in 'event_score', with: '24-0'

    click_on 'Create Event'
    visit events_path
    click_on 'Attendance Record'
    click_on 'New Attendance Record'

    page.select('Nina Rao', from: :attendancerecord_player_id)
    page.select('Present', from: :attendancerecord_attendancetype)
    fill_in :attendancerecord_note, with: 'n/a'

    click_on 'Set Attendance Record'

    click_on 'Delete'
    click_on 'Delete Attendance Record'
    expect(page).not_to have_content('Nina Rao')
    expect(page).not_to have_content('Present')
    expect(page).not_to have_content('n/a')
  end
end

RSpec.describe 'Editing an Attendance Record', type: :feature do
  Rails.application.env_config['devise.mapping'] = Devise.mappings[:user]
  Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]

  scenario '- valid inputs' do
    visit root_path
    click_on 'Sign in with Google'
    visit new_player_path

    fill_in :player_uin, with: 727_001_489
    fill_in 'Name', with: 'Nina Rao'
    fill_in 'Email', with: 'ninarao09@tamu.edu'
    fill_in :player_phone_number, with: '1234567890'
    fill_in 'Address', with: '100 address'
    page.select('Player', from: :player_person_type)
    fill_in 'Dues', with: 120
    page.select('Active', from: :player_status)

    click_on 'Create Player'

    visit root_path
    visit new_event_path
    fill_in 'event_name', with: 'Practice 1'
    fill_in 'event_info', with: 'First practice of the season'
    fill_in 'event_date', with: '2021-03-09'
    fill_in 'event_time', with: '2000-01-01 16:37:00 UTC'
    page.select('Game', from: :event_event_type)
    fill_in 'event_address', with: 'test'
    page.select('7s', from: :event_season)
    fill_in 'event_score', with: '24-0'
    click_on 'Create Event'
    visit events_path
    click_on 'Attendance Record'
    click_on 'New Attendance Record'

    page.select('Nina Rao', from: :attendancerecord_player_id)
    page.select('Present', from: :attendancerecord_attendancetype)
    fill_in :attendancerecord_note, with: 'n/a'

    click_on 'Set Attendance Record'

    click_on 'Edit'
    fill_in :attendancerecord_note, with: 'edited note'
    click_on 'Set Attendance Record'
    click_on 'Attendance Record'

    expect(page).to have_content('Nina Rao')
    expect(page).to have_content('Present')
    expect(page).to have_content('edited note')
  end
end

RSpec.describe 'Authentication', type: :feature do
  Rails.application.env_config['devise.mapping'] = Devise.mappings[:user]
  Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]

  scenario 'visit path without logging in' do
    visit people_path
    expect(page).to have_content('You need to sign in or sign up')
  end
  scenario 'visit dashboard after logging in' do
    visit root_path
    click_on 'Sign in with Google'
    visit root_path
    expect(page).to have_content('Dashboard')
  end
  scenario 'sign out takes to homepage' do
    visit root_path
    click_on 'Sign in with Google'
    click_on 'Sign Out'
    expect(page).to have_content('Sign in with Google')
  end
end

RSpec.describe 'Invalid Authentication', type: :feature do
  before :each do
    Rails.application.env_config['devise.mapping'] = Devise.mappings[:user]
    OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
                                                                         provider: 'google_oauth2',
                                                                         uid: '12345657',
                                                                         info: {
                                                                           name: 'Rao2 Shelby',
                                                                           email: ''
                                                                         },
                                                                         credentials: {
                                                                           token: 'token',
                                                                           refresh_token: 'refresh token'
                                                                         }
                                                                       })
  end
  scenario 'invalid email' do
    visit root_path
    click_on 'Sign in with Google'
    expect(page).to have_content('is not authorized.')
  end
end
