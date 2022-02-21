# frozen_string_literal: true

FactoryBot.define do
  factory :phone do
    number { '(11) 90000-3333' }
    kind { 'home' }
    main { true }
    contact
  end
end
