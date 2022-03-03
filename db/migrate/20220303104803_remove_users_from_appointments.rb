class RemoveUsersFromAppointments < ActiveRecord::Migration[6.1]
  def change
    remove_reference :appointments, :asker, null: false, foreign_key: { to_table: :users }
    remove_reference :appointments, :receiver, null: false, foreign_key: { to_table: :users }
  end
end
