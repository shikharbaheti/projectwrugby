# location: spec/unit/unit_spec.rb
require 'rails_helper'

RSpec.describe Person, type: :model do
  subject do
    described_class.new(person_id: 1, name: 'Nina Rao', email: 'ninarao09@tamu.edu', phone_number: '1234567890',
                        address: '100 address', person_type: 1)
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a person id' do
    subject.person_id = nil
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

RSpec.describe Admin, type: :model do
  subject do
    described_class.new(id: 1, email: 'ninarao09@tamu.edu', full_name: 'Nina Rao', uid: '727001489', avatar_url: '---')
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end
end
