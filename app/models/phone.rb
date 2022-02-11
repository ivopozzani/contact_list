# frozen_string_literal: true

class Phone < ApplicationRecord
  belongs_to :contact
  validates :number, presence: true, uniqueness: { scope: :contact_id }
  validates :kind, inclusion: { in: %w[home work another] }
  validates :main, uniqueness: { scope: :contact_id, conditions: lambda {
                                                                   where(main: true)
                                                                 } }, inclusion: { in: [true, false] }

  before_validation :update_main_column

  private

  def update_main_column
    if main == true
      phone_number = Phone.find_by(contact_id:, main: true)
      return if phone_number.nil?

      phone_number.update_column :main, false
    end
  end
end
