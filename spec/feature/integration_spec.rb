# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating a Person', type: :feature do
  scenario 'valid inputs' do
    visit new_person_path
    fill_in :person_person_id, with: 1
    fill_in 'Name', with: 'Nina Rao'
    fill_in 'Email', with: 'ninarao09@tamu.edu'
    fill_in :person_phone_number, with: '1234567890'
    fill_in 'Address', with: '100 address'
    fill_in :person_person_type, with: 1
    click_on 'Create Person'
    visit people_path
    expect(page).to have_content(1)
    expect(page).to have_content('Nina Rao')
    expect(page).to have_content('ninarao09@tamu.edu')
    expect(page).to have_content('1234567890')
    expect(page).to have_content('100 address')
    expect(page).to have_content(1)
  end

  scenario 'invalid person_id' do
    visit new_person_path
    fill_in 'Name', with: 'Nina Rao'
    fill_in 'Email', with: 'ninarao09@tamu.edu'
    fill_in :person_phone_number, with: '1234567890'
    fill_in 'Address', with: '100 address'
    fill_in :person_person_type, with: 1
    click_on 'Create Person'
    visit people_path
    expect(page).not_to have_content(1)
  end

  scenario 'invalid name' do
    visit new_person_path
    fill_in :person_person_id, with: 1
    fill_in 'Email', with: 'ninarao09@tamu.edu'
    fill_in :person_phone_number, with: '1234567890'
    fill_in 'Address', with: '100 address'
    fill_in :person_person_type, with: 1
    click_on 'Create Person'
    visit people_path
    expect(page).not_to have_content('Nina Rao')
  end

  scenario 'invalid email' do
    visit new_person_path
    fill_in :person_person_id, with: 1
    fill_in 'Name', with: 'Nina Rao'
    fill_in :person_phone_number, with: '1234567890'
    fill_in 'Address', with: '100 address'
    fill_in :person_person_type, with: 1
    click_on 'Create Person'
    visit people_path
    expect(page).not_to have_content('ninarao09@tamu.edu')
  end

  scenario 'invalid phone number' do
    visit new_person_path
    fill_in :person_person_id, with: 1
    fill_in 'Name', with: 'Nina Rao'
    fill_in 'Email', with: 'ninarao09@tamu.edu'
    fill_in 'Address', with: '100 address'
    fill_in :person_person_type, with: 1
    click_on 'Create Person'
    visit people_path
    expect(page).not_to have_content('1234567890')
  end

  scenario 'invalid address' do
    visit new_person_path
    fill_in :person_person_id, with: 1
    fill_in 'Name', with: 'Nina Rao'
    fill_in 'Email', with: 'ninarao09@tamu.edu'
    fill_in :person_phone_number, with: '1234567890'
    fill_in :person_person_type, with: 1
    click_on 'Create Person'
    visit people_path
    expect(page).not_to have_content('100 address')
  end

  scenario 'invalid person type' do
    visit new_person_path
    fill_in :person_person_id, with: 1
    fill_in 'Name', with: 'Nina Rao'
    fill_in 'Email', with: 'ninarao09@tamu.edu'
    fill_in :person_phone_number, with: '1234567890'
    fill_in 'Address', with: '100 address'
    click_on 'Create Person'
    visit people_path
    expect(page).not_to have_content(1)
  end

  
  

end