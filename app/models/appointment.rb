class Appointment < ApplicationRecord
  belongs_to :asker_language, class_name: "UserLanguage"
  belongs_to :receiver_language, class_name: "UserLanguage"

  geocoded_by :location
  validates :datetime, presence:true

  after_validation :geocode
  after_create :send_message

  def asker
    asker_language.user
  end

  def receiver
    receiver_language.user
  end

  def a_language
    asker_language.language
  end

  def r_language
    receiver_language.language
  end

  def other_user(current_user)
    return asker if receiver == current_user #the other user - given by controller?

    return receiver if asker == current_user #the other user - given by controller?
  end

  def other_user_language(current_user)
    other_user(current_user) == asker ? asker_language : receiver_language
  end

  private

  def send_message
    # find the existing chatroom
    chatroom = Chatroom.joins(:users).find_by(users: [asker, receiver])
    # if there is not a chatroom between both
    # create a new chatroom and add them
    unless chatroom
      chatroom = Chatroom.create
      chatroom.users << [asker, receiver] 
    end
    
    # create a new message
    Message.create(
      content: new_appointment_message,
      chatroom: chatroom,
      user: asker
    )
  end

  def new_appointment_message
    "Hello #{receiver.first_name},
    I just scheduled an appointment with you at #{datetime.strftime("%d %b %Y, %H:%M")}."
  end
end
