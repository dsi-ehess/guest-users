class AddFieldsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :user_status, :integer, default: 0
    add_reference :users, :host, foreign_key: { to_table: :users }, null: true
  end
end
