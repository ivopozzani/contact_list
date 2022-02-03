# frozen_string_literal: true

class Phone < ApplicationRecord
  belongs_to :contact
  validates :number, presence: true, uniqueness: { scope: :contact_id }
  validates :kind, inclusion: { in: %w[home work another] }
  validates :main, uniqueness: { scope: :contact_id, conditions: lambda {
                                                                   where(main: true)
                                                                 } }, inclusion: { in: [true, false] }
end
