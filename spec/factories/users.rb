# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { 'TestUser' }
    age  { 32 }
    biography { 'fdofksodfksdofksdofk' }
  end
end
