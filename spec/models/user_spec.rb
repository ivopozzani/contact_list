# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it 'creates a valid user' do
    user = build(:user)
    expect(user.new_record?).to be true
  end

  it 'creates many users' do
    %w[user1 user2 usert3 usert4].each do |name|
      users = create(:user, name:)
    end
    expect(User.all.count).to eq(4)
  end
end
