class ChatUser < ApplicationRecord
  belongs_to :user
  belongs_to :chatroom

  validate :no_other_chat_for_same_users

  def no_other_chat_for_same_users
    # check other users for this chatroom
    # if there are two or more, smth is wrong
    chatroom_users = chatroom.users
    if chatroom_users.count > 1
      errors.add(:chatroom, "too many users for this")
    # if there is one,
    elsif chatroom_users.count == 1
      # we need to check who the other user is
      another_user = chatroom_users.first
      # and if there is another chatroom for these two users
      # REFACTOR THIS WITH ACTIVE RECORD
      if Chatroom.all.map(&:user_ids).any? { |user_ids| user_ids.sort == [user_id, another_user.id].sort }
        errors.add(:chatroom, "chatroom created for these users already")
      end
    end
  end
end
