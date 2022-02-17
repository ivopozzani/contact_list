# frozen_string_literal: true

class User < ApplicationRecord
  has_many :contacts, dependent: :destroy
  has_many :phones, through: :contacts
  validates :name, presence: true, uniqueness: true
  validates :age, numericality: { only_integer: true, greater_than: 0 }
end
