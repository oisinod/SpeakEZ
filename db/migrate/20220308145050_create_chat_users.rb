class CreateChatUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :chat_users do |t|

      t.timestamps
    end
  end
end
