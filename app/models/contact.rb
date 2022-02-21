# frozen_string_literal: true

class Contact < ApplicationRecord
  belongs_to :user
  has_many :phones, dependent: :destroy
  validates :name, presence: true, uniqueness: { scope: :user_id }

  def main_phone
    Phone.find_by(contact_id: id, main: true)
  end
end
