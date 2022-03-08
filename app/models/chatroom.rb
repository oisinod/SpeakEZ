class Chatroom < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :chat_users
  has_many :users, through: :chat_users

  # validate :has_unique_users

  # def has_unique_users
  #     if self.class.where(user1: self.users[0], user2: self.users[1])
  #                  .or(self.class.where(user1: self.users[1], user2: self.users[0]))
  #                  .exists?
  #       errors.add(:base, 'User 1 and User 2 combination exists!')
  #     end
  # end
end
