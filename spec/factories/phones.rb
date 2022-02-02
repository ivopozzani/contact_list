# frozen_string_literal: true

FactoryBot.define do
  factory :phone do
    number { 'MyString' }
    kind { 'MyString' }
    main { false }
    contact { nil }
  end
end
