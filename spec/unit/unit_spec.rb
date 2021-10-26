# location: spec/unit/unit_spec.rb
require 'rails_helper'

RSpec.describe Person, type: :model do
  subject do
    described_class.new(uin: 727001489, name: 'Nina Rao', email: 'ninarao09@tamu.edu', phone_number: '1234567890',
                        address: '100 address', person_type: 'Player')
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a uin/id' do
    subject.uin = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without a email' do
    subject.email = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without a phone number' do
    subject.phone_number = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without a address' do
    subject.address = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without a person type' do
    subject.person_type = nil
    expect(subject).not_to be_valid
  end
end

RSpec.describe Event, type: :model do
  subject do
    described_class.new(name:'Practice 1', info:'First practice of the season', date: Date.today,
    time: '2000-01-01 16:37:00 UTC')
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without an event name' do
    subject.name = nil
    expect(subject).to be_valid
  end
  it 'is not valid without an event info' do
    subject.info = nil
    expect(subject).to be_valid
  end

end