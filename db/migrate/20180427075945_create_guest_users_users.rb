class CreateGuestUsersUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :guest_users_users do |t|

      t.timestamps
    end
  end
end
