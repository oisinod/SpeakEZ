class DeleteAppointmentIdFromChatroom < ActiveRecord::Migration[6.1]
  def change
    remove_column :chatrooms, :appointment_id
  end
end
