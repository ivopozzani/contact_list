# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  fixtures :all

  it 'is valid user with valid atributes' do
    expect(users(:one)).to be_valid
    expect(users(:two)).to be_valid
  end

  it 'criates two users' do
    expect(users.count).to eq 2
  end
end
