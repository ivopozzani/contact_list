# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Contact, type: :model do
  context 'When form fiels are invalid' do
    it 'does not create a contact with blank name' do
      expect do
        create(:contact, name: nil)
      end.to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Name can't be blank")
    end

    it 'does not create two contacts with same name' do
      expect do
        %w[contact contact].each do |name|
          create(:contact, name:)
        end
      end.to raise_error(ActiveRecord::RecordInvalid, 'Validation failed: Name has already been taken')
    end
  end

  context 'When form fields are valid' do
    it 'creates a valid contact' do
      expect(create(:contact)).to be_valid
    end

    it 'contact belongs to a user' do
      contact = build(:contact)
      expect(contact.user.new_record?).to be true
    end

    it 'creates two contacts with same name but diferent users' do
      user1 = create(:user, name: 'u1')
      user2 = create(:user, name: 'u2')
      c1 = create(:contact, name: 'contact', user_id: 1)
      c2 = create(:contact, name: 'contact', user_id: 2)
      expect(Contact.all.count).to eq(2)
    end

    it 'creates many contacts for single user' do
      user = create(:user, id: 10)
      %w[contact1 contact2 contact3 contact4 contact5].each do |name|
        contacts = create(:contact, name:, user:)
      end
      expect(Contact.where(user_id: 10).count).to eq(5)
    end
  end
end
