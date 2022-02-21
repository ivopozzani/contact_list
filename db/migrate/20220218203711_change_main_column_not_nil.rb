# frozen_string_literal: true

class ChangeMainColumnNotNil < ActiveRecord::Migration[6.1]
  def change
    change_column_null(:phones, :main, false)
  end
end
