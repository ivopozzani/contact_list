# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it 'creates valid users' do
    user = create(:user)
    user2 = create(:user)
    expect(user).to be_valid
    expect(user2).to be_valid
  end
end
