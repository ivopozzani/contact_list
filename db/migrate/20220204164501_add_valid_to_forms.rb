class AddValidToForms < ActiveRecord::Migration[6.1]
  def change
    add_index(:users, :name, unique: true)
    add_index(:contacts, [:name, :user_id], unique: true)
    add_index(:phones, [:number, :contact_id], unique: true)
    change_column_null(:users, :name, false)
    change_column_null(:contacts, :name, false)
    change_column_null(:phones, :number, false)
    change_column_null(:phones, :kind, false)
  end
end
