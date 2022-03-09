class AddReferencesToChatUser < ActiveRecord::Migration[6.1]
  def change
    add_reference :chat_users, :user, null: false, foreign_key: true
    add_reference :chat_users, :chatroom, null: false, foreign_key: true
  end
end
