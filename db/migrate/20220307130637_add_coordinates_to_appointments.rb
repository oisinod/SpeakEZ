class AddCoordinatesToAppointments < ActiveRecord::Migration[6.1]
  def change
    add_column :appointments, :latitude, :float
    add_column :appointments, :longitude, :float
  end
end
