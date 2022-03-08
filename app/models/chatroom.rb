class Chatroom < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :chat_users
  has_many :users, through: :chat_users

  validate :has_unique_users

  def has_unique_users

  end

end
