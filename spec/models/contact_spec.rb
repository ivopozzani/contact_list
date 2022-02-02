# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Contact, type: :model do
  it 'creates a valid contact' do
    contact = build(:contact)
    expect(contact.new_record?).to be true
  end

  it 'contact belongs to a user' do
    contact = build(:contact)
    expect(contact.user.new_record?).to be true
  end

  it 'creates many contacts for single user' do
    user = create(:user, id: 10)
    %w[contact1 contact2 contact3 contact4 contact5].each do |name|
      contacts = create(:contact, name:, user:)
    end
    expect(Contact.where(user_id: 10).count).to eq(5)
  end
end
