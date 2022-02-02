# frozen_string_literal: true

FactoryBot.define do
  factory :phone do
    number { '(11) 94323-3234' }
    kind { 'casa' }
    main { false }
    contact
  end
end
