# frozen_string_literal: true

FactoryBot.define do
  factory :contact do
    name {'contact'}
    birth_date {01/01/2001}
    user
  end
end
