# frozen_string_literal: true

FactoryBot.define do
  factory :contact do
    name { 'contact' }
    birth_date { 0o1 / 0o1 / 2001 }
    user
  end
end
