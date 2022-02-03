# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'When not valid' do
    it 'does not create a user with blank name' do
      expect do
        create(:user, name: nil)
      end.to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Name can't be blank")
    end

    it 'only creates a user with age as integer' do
      expect do
        create(:user, age: 3.2)
      end.to raise_error(ActiveRecord::RecordInvalid, 'Validation failed: Age must be an integer')
    end

    it 'does not create a user aged bellow 0' do
      expect do
        create(:user, age: -2)
      end.to raise_error(ActiveRecord::RecordInvalid, 'Validation failed: Age must be greater than 0')
    end

    it 'does not create two users with same name' do
      expect do
        %w[user user].each do |name|
          create(:user, name:)
        end
      end.to raise_error(ActiveRecord::RecordInvalid, 'Validation failed: Name has already been taken')
    end
  end

  context 'When valid' do
    it 'creates a valid user' do
      expect(create(:user)).to be_valid
    end

    it 'creates many users' do
      %w[user1 user2 usert3 usert4].each do |name|
        users = create(:user, name:)
      end
      expect(User.all.count).to eq(4)
    end
  end
end
