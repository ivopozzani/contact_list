# frozen_string_literal: true

class Contact < ApplicationRecord
  belongs_to :user
  has_many :phones
end
