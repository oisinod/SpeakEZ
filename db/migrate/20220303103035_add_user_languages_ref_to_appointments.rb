class AddUserLanguagesRefToAppointments < ActiveRecord::Migration[6.1]
  def change
    add_reference :appointments, :asker_language, null: false, foreign_key: { to_table: :user_languages }
    add_reference :appointments, :receiver_language, null: false, foreign_key: { to_table: :user_languages }
  end
end
