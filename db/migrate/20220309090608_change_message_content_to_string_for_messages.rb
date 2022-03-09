class ChangeMessageContentToStringForMessages < ActiveRecord::Migration[6.1]
  def change
    change_column :messages, :content, :string
  end
end
