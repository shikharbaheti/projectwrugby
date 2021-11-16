# frozen_string_literal: true

# location: spec/unit/unit_spec.rb
require 'rails_helper'

RSpec.describe Person, type: :model do
  subject do
    described_class.new(uin: 727_001_489, name: 'Nina Rao', email: 'ninarao09@tamu.edu', phone_number: '1234567890',
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

RSpec.describe Player, type: :model do
  subject do
    described_class.new(uin: 727_001_489, name: 'Nina Rao', email: 'ninarao09@tamu.edu', phone_number: '1234567890',
                        address: '100 address', person_type: 'Player', dues: 120, status: 'Active')
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

  it 'is not valid without a address' do
    subject.dues = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without a person type' do
    subject.status = nil
    expect(subject).not_to be_valid
  end
end

RSpec.describe Transaction, type: :model do
  let(:person) do
    Person.new(id: 1, uin: 727_001_489, name: 'Nina Rao', email: 'ninarao09@tamu.edu', phone_number: '1234567890',
               address: '100 address', person_type: 'Player')
  end
  let(:merchandise) do
    Merchandise.new(id: 1, item_name: 'Sweatshirt', purchase_price: 10, quantity_on_hand: 10, sell_price: 20)
  end

  subject do
    described_class.new(person: person, merchandise: merchandise, amount: 45, transaction_date: Date.today)
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without an amount' do
    subject.amount = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without a transaction_date' do
    subject.transaction_date = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without a person associated to it' do
    subject.person_id = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without a merchandise associated to it' do
    subject.merchandise_id = nil
    expect(subject).not_to be_valid
  end
end

RSpec.describe Merchandise, type: :model do
  subject do
    described_class.new(item_name: 'Sweatshirt', purchase_price: 10, quantity_on_hand: 10, sell_price: 20)
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end
  it 'is not valid without an item name' do
    subject.item_name = nil
    expect(subject).not_to be_valid
  end
  it 'is not valid without a purchase price' do
    subject.purchase_price = nil
    expect(subject).not_to be_valid
  end
  it 'is not valid without a quantity' do
    subject.quantity_on_hand = nil
    expect(subject).not_to be_valid
  end
  it 'is not valid without a price' do
    subject.sell_price = nil
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

RSpec.describe Event, type: :model do
  subject do
    described_class.new(name: 'Practice 1', info: 'First practice of the season', date: Date.today,
                        time: '2000-01-01 16:37:00 UTC', event_type: 'Game', address: 'test', season: '7s', score: '24-0')
  end

  it 'is not valid without an event name' do
    subject.name = nil
    expect(subject).not_to be_valid
  end
  it 'is not valid without an event date' do
    subject.date = nil
    expect(subject).not_to be_valid
  end
  it 'is not valid without an event time' do
    subject.time = nil
    expect(subject).not_to be_valid
  end
  it 'is not valid without an event address' do
    subject.address = nil
    expect(subject).not_to be_valid
  end
end

RSpec.describe Attendancerecord, type: :model do
  let(:player) do
    Player.new(id: 1, uin: 727_001_489, name: 'Nina Rao', email: 'ninarao09@tamu.edu', phone_number: '1234567890',
               address: '100 address', person_type: 'Player')
  end
  let(:event) do
    Event.new(id: 1, name: 'Practice 1', info: 'First practice of the season', date: Date.today,
              time: '2000-01-01 16:37:00 UTC', event_type: 'Game', address: 'test', season: '7s', score: '24-0')
  end

  subject do
    described_class.new(event: event, player: player, id: 1, attendancetype: 'Present', note: 'n/a')
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without an attendance type' do
    subject.attendancetype = nil
    expect(subject).not_to be_valid
  end
end

RSpec.describe Encounter, type: :model do
  subject do
    described_class.new(recruit_id: 1, notes: 'this is a note')
  end

  it 'is not valid without a recruit_id' do
    subject.recruit_id = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without notes' do
    subject.notes = nil
    expect(subject).not_to be_valid
  end
end
