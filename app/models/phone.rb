# frozen_string_literal: true

class Phone < ApplicationRecord
  belongs_to :contact
  validates :number, presence: true, uniqueness: { scope: :contact_id }
  validates :kind, inclusion: { in: %w[home work another] }
  validates :main, inclusion: { in: [true, false] }
  validates_each :main do |record, attr, value|
    if !value && record.contact.main_phone.nil?
      record.errors.add(attr, 'must have at least one main phone')
    end
  end

  before_save :update_main_column, if: :main

  private

  def update_main_column
    return if contact.main_phone.nil?

    contact.main_phone.update_column :main, false
  end
end
