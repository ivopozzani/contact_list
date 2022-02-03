# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Phone, type: :model do
  context 'When not valid' do
    it 'does not create a phone with blank number' do
      expect do
        create(:phone, number: nil)
      end.to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Number can't be blank")
    end

    it 'does not create a phone of diferent kind' do
      expect do
        create(:phone, kind: 'else')
      end.to raise_error(ActiveRecord::RecordInvalid, 'Validation failed: Kind is not included in the list')
    end

    it 'does not create two phones as main' do
      c1 = create(:contact)
      expect do
        ['(11) 9000-5000', '(11) 99999-9999'].each do |number|
          create(:phone, number:, main: true, contact_id: 1)
        end
      end.to raise_error(ActiveRecord::RecordInvalid, 'Validation failed: Main has already been taken')
    end
  end

  context 'When valid' do
    it 'creates a valid phone number' do
      expect(create(:phone)).to be_valid
    end

    it 'phone number belongs to a contact' do
      p_number = build(:phone)
      expect(p_number.contact.new_record?).to be true
    end

    it 'creates two phones with same number but diferent contacts' do
      u1 = create(:user)
      c1 = create(:contact, name: 'c1', user_id: 1)
      c2 = create(:contact, name: 'c2', user_id: 1)
      p1 = create(:phone, number: '(11) 94323-3234', contact_id: 1)
      p2 = create(:phone, number: '(11) 94323-3234', contact_id: 2)
      expect(Phone.all.count).to eq(2)
    end

    it 'creates many phone numbers for single contact' do
      contact = create(:contact, id: 10)
      %w[1234561 12345612 12345613 12345614 12345615].each do |number|
        p_numbers = create(:phone, number:, contact:)
      end
      expect(Phone.where(contact_id: 10).count).to eq(5)
    end
  end
end
