# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Contact, type: :model do
  it 'creates a new contact' do
    contact = build(:contact, name: 'contact', birth_date: '01/01/2001')
    expect(contact.new_record?).to be true
  end

  it 'belongs to user form' do
    contact = build(:contact, name: 'contact2', birth_date: '01/01/2001')
    expect(contact.user.new_record?).to be true
  end

  it 'creates many contacts for a user' do
    ["contact1","contact2","contact3","contact4","contact5"].each do |name|
        contacts = create(:contact, name: name)
    end
    expect(Contact.count).to eq(5)
  end
end
