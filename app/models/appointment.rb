class Appointment < ApplicationRecord
  belongs_to :asker_language, class_name: "UserLanguage"
  belongs_to :receiver_language, class_name: "UserLanguage"
  has_one :chatroom

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
end
