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

RSpec.describe Transaction, type: :model do
  subject do
    described_class.new(amount: 45, transaction_date: Date.today)
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
