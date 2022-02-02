# frozen_string_literal: true

class CreatePhones < ActiveRecord::Migration[6.1]
  def change
    create_table :phones do |t|
      t.string :number
      t.string :kind
      t.boolean :main
      t.references :contact, null: false, foreign_key: true

      t.timestamps
    end
  end
end
