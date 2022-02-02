# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Phone, type: :model do
  it 'creates a valid phone number' do
    p_number = build(:phone)
    expect(p_number.new_record?).to be true
  end

  it 'phone number belongs to a contact' do
    p_number = build(:phone)
    expect(p_number.contact.new_record?).to be true
  end

  it 'creates many phone numbers for single contact' do
     contact = create(:contact, id: 10)
     %w[1234561 12345612 12345613 12345614 12345615].each do |number|
      p_numbers = create(:phone, number:, contact:)
    end
    expect(Phone.where(contact_id: 10).count).to eq(5)
  end
end
