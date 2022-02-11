# frozen_string_literal: true

class Contact < ApplicationRecord
  belongs_to :user
  has_many :phones
  has_many :phones, through :contacts
  validates :name, presence: true, uniqueness: { scope: :user_id }
end
