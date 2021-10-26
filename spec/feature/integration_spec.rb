# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating an Alumni', type: :feature do

  Rails.application.env_config["devise.mapping"] = Devise.mappings[:user]
  Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]

  scenario 'valid inputs for new person page - Player' do
    visit root_path
    click_on 'Sign in with Google'
    visit new_person_path

    fill_in :person_uin, with: 727001489
    fill_in 'Name', with: 'Nina Rao'
    fill_in 'Email', with: 'ninarao09@tamu.edu'
    fill_in :person_phone_number, with: '1234567890'
    fill_in 'Address', with: '100 address'
    page.select("Player", :from => :person_person_type)
    click_on 'Create Person'
    visit people_path
    expect(page).to have_content(727001489)
    expect(page).to have_content('Nina Rao')
    expect(page).to have_content('ninarao09@tamu.edu')
    expect(page).to have_content('1234567890')
    expect(page).to have_content('100 address')
    expect(page).to have_content("Player")
  end

  scenario 'valid inputs for new person page - Alumni' do
    visit root_path
    click_on 'Sign in with Google'
    visit new_person_path

    fill_in :person_uin, with: 727001489
    fill_in 'Name', with: 'Nina Rao'
    fill_in 'Email', with: 'ninarao09@tamu.edu'
    fill_in :person_phone_number, with: '1234567890'
    fill_in 'Address', with: '100 address'
    page.select("Alumni", :from => :person_person_type)
    click_on 'Create Person'
    visit alumnis_path
    expect(page).to have_content(727001489)
    expect(page).to have_content('Nina Rao')
    expect(page).to have_content('ninarao09@tamu.edu')
    expect(page).to have_content('1234567890')
    expect(page).to have_content('100 address')
    expect(page).to have_content("Alumni")
  end

  scenario 'invalid person_id' do
    visit root_path
    click_on 'Sign in with Google'
    visit new_person_path
    fill_in :person_name, with: 'Nina Rao'
    fill_in 'Email', with: 'ninarao09@tamu.edu'
    fill_in :person_phone_number, with: '1234567890'
    fill_in 'Address', with: '100 address'
    page.select("Player", :from => :person_person_type)
    click_on 'Create Person'
    visit people_path
    expect(page).not_to have_content(727001489, count: 1)
  end

  scenario 'invalid name' do
    visit root_path
    click_on 'Sign in with Google'
    visit new_person_path
    fill_in :person_uin, with: 727001489
    fill_in 'Email', with: 'ninarao09@tamu.edu'
    fill_in :person_phone_number, with: '1234567890'
    fill_in 'Address', with: '100 address'
    page.select("Player", :from => :person_person_type)
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
    page.select("Player", :from => :person_person_type)
    click_on 'Create Person'
    visit people_path
    expect(page).not_to have_content('ninarao09@tamu.edu', count: 1)
  end

  scenario 'invalid phone number' do
    visit root_path
    click_on 'Sign in with Google'
    visit new_person_path
    fill_in :person_uin, with: 727001489
    fill_in 'Name', with: 'Nina Rao'
    fill_in 'Email', with: 'ninarao09@tamu.edu'
    fill_in 'Address', with: '100 address'
    page.select("Player", :from => :person_person_type)
    click_on 'Create Person'
    visit people_path
    expect(page).not_to have_content('1234567890', count: 1)
  end

  scenario 'invalid address' do
    visit root_path
    click_on 'Sign in with Google'
    visit new_person_path
    fill_in :person_uin, with: 727001489
    fill_in 'Name', with: 'Nina Rao'
    fill_in 'Email', with: 'ninarao09@tamu.edu'
    fill_in :person_phone_number, with: '1234567890'
    page.select("Player", :from => :person_person_type)
    click_on 'Create Person'
    visit people_path
    expect(page).not_to have_content('100 address', count: 1)
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
    expect(page).not_to have_content('Player', count: 2)
  end

end

RSpec.describe 'Deleting a Person', type: :feature do
  Rails.application.env_config["devise.mapping"] = Devise.mappings[:user]
  Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]
    
  scenario 'Clicking the button' do
    visit root_path
    click_on 'Sign in with Google'
    visit new_person_path

    fill_in :person_uin, with: 727001489
    fill_in 'Name', with: 'Nina Rao'
    fill_in 'Email', with: 'ninarao09@tamu.edu'
    fill_in :person_phone_number, with: '1234567890'
    fill_in 'Address', with: '100 address'
    page.select("Player", :from => :person_person_type)
    click_on 'Create Person'
    visit people_path

    click_on 'Delete'
    click_on 'Delete Person'
    visit people_path

    expect(page).not_to have_content(727001489)
    expect(page).not_to have_content('Nina Rao')
    expect(page).not_to have_content('ninarao09@tamu.edu')
    expect(page).not_to have_content('1234567890')
    expect(page).not_to have_content('100 address')
  end
end


RSpec.describe 'Editing a Person', type: :feature do
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
    page.select("Player", :from => :person_person_type)
    click_on 'Create Person'
    visit people_path

    click_on 'Edit'
    fill_in :person_uin, with: 727000000
    click_on 'Update Person'
    visit people_path

    expect(page).to have_content(727000000)
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

    fill_in :person_uin, with: 727001489
    fill_in 'Name', with: 'Nina Rao'
    fill_in 'Email', with: 'ninarao09@tamu.edu'
    fill_in :person_phone_number, with: '1234567890'
    fill_in 'Address', with: '100 address'
    page.select("Player", :from => :person_person_type)
    click_on 'Create Person'
    visit people_path

    click_on 'Edit'
    fill_in :person_uin, with: nil
    click_on 'Update Person'
    visit people_path

    expect(page).to have_content(727001489)
    expect(page).to have_content('Nina Rao')
    expect(page).to have_content('ninarao09@tamu.edu')
    expect(page).to have_content('1234567890')
    expect(page).to have_content('100 address')
    expect(page).to have_content('Player')

  end
end

RSpec.describe 'Creating an Player', type: :feature do
  Rails.application.env_config["devise.mapping"] = Devise.mappings[:user]
  Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]

  scenario 'valid inputs for new player page' do
    visit root_path
    click_on 'Sign in with Google'
    visit new_player_path

    fill_in :player_uin, with: 727001489
    fill_in 'Name', with: 'Nina Rao'
    fill_in 'Email', with: 'ninarao09@tamu.edu'
    fill_in :player_phone_number, with: '1234567890'
    fill_in 'Address', with: '100 address'
    page.select("Player", :from => :player_person_type)
    fill_in 'Dues', with: 120
    page.select("Active", :from => :player_status)

    click_on 'Create Player'
    visit players_path
    expect(page).to have_content(727001489)
    expect(page).to have_content('Nina Rao')
    expect(page).to have_content('ninarao09@tamu.edu')
    expect(page).to have_content('1234567890')
    expect(page).to have_content('100 address')
    expect(page).to have_content("Player")
    expect(page).to have_content(120)
    expect(page).to have_content("Active")
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
    page.select("Player", :from => :player_person_type)
    fill_in 'Dues', with: nil
    page.select("Active", :from => :player_status)

    click_on 'Create Player'
    visit players_path
    expect(page).not_to have_content(727001489)
    expect(page).not_to have_content('Nina Rao')
    expect(page).not_to have_content('ninarao09@tamu.edu')
    expect(page).not_to have_content('1234567890')
    expect(page).not_to have_content('100 address')
    expect(page).not_to have_content("Player", count: 2)
    expect(page).not_to have_content(120)
    expect(page).not_to have_content("Active")
  end

end

RSpec.describe 'Deleting an Player', type: :feature do
  Rails.application.env_config["devise.mapping"] = Devise.mappings[:user]
  Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]

  scenario 'Clicking the button' do
    visit root_path
    click_on 'Sign in with Google'
    visit new_player_path

    fill_in :player_uin, with: 727001489
    fill_in 'Name', with: 'Nina Rao'
    fill_in 'Email', with: 'ninarao09@tamu.edu'
    fill_in :player_phone_number, with: '1234567890'
    fill_in 'Address', with: '100 address'
    page.select("Player", :from => :player_person_type)
    fill_in 'Dues', with: 120
    page.select("Active", :from => :player_status)
    click_on 'Create Player'
    visit players_path

    click_on 'Delete'
    click_on 'Delete Player'
    visit players_path

    expect(page).not_to have_content(727001489)
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
  Rails.application.env_config["devise.mapping"] = Devise.mappings[:user]
  Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]

  scenario 'valid inputs for edit player page' do
    visit root_path
    click_on 'Sign in with Google'
    visit new_player_path

    fill_in :player_uin, with: 727001489
    fill_in 'Name', with: 'Nina Rao'
    fill_in 'Email', with: 'ninarao09@tamu.edu'
    fill_in :player_phone_number, with: '1234567890'
    fill_in 'Address', with: '100 address'
    page.select("Player", :from => :player_person_type)
    fill_in 'Dues', with: 120
    page.select("Active", :from => :player_status)

    click_on 'Create Player'
    visit players_path

    click_on 'Edit'
    fill_in :player_uin, with: 727000000
    click_on 'Update Player'
    visit players_path

    expect(page).to have_content(727000000)
    expect(page).to have_content('Nina Rao')
    expect(page).to have_content('ninarao09@tamu.edu')
    expect(page).to have_content('1234567890')
    expect(page).to have_content('100 address')
    expect(page).to have_content("Player")
    expect(page).to have_content(120)
    expect(page).to have_content("Active")
  end

  scenario 'invalid inputs for edit player page' do
    visit root_path
    click_on 'Sign in with Google'
    visit new_player_path

    fill_in :player_uin, with: 727001489
    fill_in 'Name', with: 'Nina Rao'
    fill_in 'Email', with: 'ninarao09@tamu.edu'
    fill_in :player_phone_number, with: '1234567890'
    fill_in 'Address', with: '100 address'
    page.select("Player", :from => :player_person_type)
    fill_in 'Dues', with: 120
    page.select("Active", :from => :player_status)

    click_on 'Create Player'
    visit players_path

    click_on 'Edit'
    fill_in :player_uin, with: nil
    click_on 'Update Player'
    visit players_path

    expect(page).to have_content(727001489)
    expect(page).to have_content('Nina Rao')
    expect(page).to have_content('ninarao09@tamu.edu')
    expect(page).to have_content('1234567890')
    expect(page).to have_content('100 address')
    expect(page).to have_content("Player")
    expect(page).to have_content(120)
    expect(page).to have_content("Active")
  end
end

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

RSpec.describe 'Deleting a Merch', type: :feature do
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

RSpec.describe 'Editing a Merchandise', type: :feature do
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

RSpec.describe 'Creating an Recruit', type: :feature do
  Rails.application.env_config["devise.mapping"] = Devise.mappings[:user]
  Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]

  scenario 'valid inputs for new recruit page' do
    visit root_path
    click_on 'Sign in with Google'
    visit new_recruit_path

    fill_in :recruit_uin, with: 727001489
    fill_in 'Name', with: 'Nina Rao'
    fill_in 'Email', with: 'ninarao09@tamu.edu'
    fill_in :recruit_phone_number, with: '1234567890'
    fill_in 'Address', with: '100 address'
    page.select("Recruit", :from => :recruit_person_type)
    fill_in :recruit_contact_type, with: 'Twitter'
    fill_in :recruit_interest_level, with: 5
    fill_in :recruit_times_contacted, with: 2
    fill_in :recruit_date_contacted, with: '2014-08-06'


    click_on 'Create Recruit'
    visit recruits_path
    expect(page).to have_content(727001489)
    expect(page).to have_content('Nina Rao')
    expect(page).to have_content('ninarao09@tamu.edu')
    expect(page).to have_content('1234567890')
    expect(page).to have_content('100 address')
    expect(page).to have_content("Player")
    expect(page).to have_content(5)
    expect(page).to have_content(2)
    expect(page).to have_content("2014-08-06")
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
    page.select("Player", :from => :recruit_person_type)
    fill_in :recruit_interest_level, with: nil
    fill_in :recruit_times_contacted, with: nil
    fill_in :recruit_date_contacted, with: '2014-08-06'
    

    click_on 'Create Recruit'
    visit recruits_path
    expect(page).not_to have_content(727001489)
    expect(page).not_to have_content('Nina Rao')
    expect(page).not_to have_content('ninarao09@tamu.edu')
    expect(page).not_to have_content('1234567890')
    expect(page).not_to have_content('100 address')
    expect(page).not_to have_content("Player", count: 2)
    expect(page).not_to have_content(5)
    expect(page).not_to have_content(2)
    expect(page).not_to have_content('2014-08-06')
  end

end

RSpec.describe 'Deleting an Recruit', type: :feature do
  Rails.application.env_config["devise.mapping"] = Devise.mappings[:user]
  Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]

  scenario 'Clicking the button' do
    visit root_path
    click_on 'Sign in with Google'
    visit new_recruit_path

    fill_in :recruit_uin, with: 727001489
    fill_in 'Name', with: 'Nina Rao'
    fill_in 'Email', with: 'ninarao09@tamu.edu'
    fill_in :recruit_phone_number, with: '1234567890'
    fill_in 'Address', with: '100 address'
    page.select("Recruit", :from => :recruit_person_type)
    fill_in :recruit_contact_type, with: 'Twitter'
    fill_in :recruit_interest_level, with: 5
    fill_in :recruit_times_contacted, with: 2
    fill_in :recruit_date_contacted, with: '2014-08-06'

    click_on 'Create Recruit'
    visit recruits_path


    click_on 'Delete'
    click_on 'Delete Recruit'
    visit recruits_path

    expect(page).not_to have_content(727001489)
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
  Rails.application.env_config["devise.mapping"] = Devise.mappings[:user]
  Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]

  scenario '- valid inputs' do
    visit root_path
    click_on 'Sign in with Google'
    visit new_recruit_path

    fill_in :recruit_uin, with: 727001489
    fill_in 'Name', with: 'Nina Rao'
    fill_in 'Email', with: 'ninarao09@tamu.edu'
    fill_in :recruit_phone_number, with: '1234567890'
    fill_in 'Address', with: '100 address'
    page.select("Recruit", :from => :recruit_person_type)
    fill_in :recruit_contact_type, with: 'Twitter'
    fill_in :recruit_interest_level, with: 5
    fill_in :recruit_times_contacted, with: 2
    fill_in :recruit_date_contacted, with: '2014-08-06'

    click_on 'Create Recruit'
    visit recruits_path


    click_on 'Edit'
    fill_in :recruit_uin, with: 727000000
    click_on 'Update Recruit'
    visit recruits_path

    expect(page).to have_content(727000000)
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

    fill_in :recruit_uin, with: 727001489
    fill_in 'Name', with: 'Nina Rao'
    fill_in 'Email', with: 'ninarao09@tamu.edu'
    fill_in :recruit_phone_number, with: '1234567890'
    fill_in 'Address', with: '100 address'
    page.select("Recruit", :from => :recruit_person_type)
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

    expect(page).not_to have_content(727000000)
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

  Rails.application.env_config["devise.mapping"] = Devise.mappings[:user]
  Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]

  scenario 'valid inputs for new event page' do
    visit root_path
    click_on 'Sign in with Google'
    visit new_event_path

    fill_in 'Name', with: 'Practice 1'
    fill_in 'event_info', with: 'First practice of the season'
    select '2021', :from => 'event_date_1i'
    select 'September', :from => 'event_date_2i'
    select '30', :from => 'event_date_3i'

    click_on 'Create Event'
    visit events_path
    expect(page).to have_content('Practice 1')
    expect(page).to have_content('First practice of the season')

  end
end

RSpec.describe 'Create a transaction', type: :feature do

  Rails.application.env_config["devise.mapping"] = Devise.mappings[:user]
  Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]

  scenario 'valid inputs for a transaction' do
    visit root_path
    click_on 'Sign in with Google'
    visit new_transaction_path
    select '2021', :from => 'transaction_transaction_date_1i'
    select 'September', :from => 'transaction_transaction_date_2i'
    select '30', :from => 'transaction_transaction_date_3i'
    fill_in 'Amount', with: 40
    click_on 'Create Transaction'
    visit transactions_path
    expect(page).to have_content(40)
    expect(page).to have_content('2021-09-30')
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
    expect(page).to have_content("TAMU Women's Rugby Team")
  end
  scenario 'sign out takes to homepage' do
    visit root_path
    click_on 'Sign in with Google' 
    click_on 'Sign Out'
    expect(page).to have_content("Sign in with Google")
  end
end