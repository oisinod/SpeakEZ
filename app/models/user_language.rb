class UserLanguage < ApplicationRecord
  belongs_to :user
  belongs_to :language
  has_many :appointments_as_asker_language, class_name: "Appointment", foreign_key: :asker_language_id
  has_many :appointments_as_receiver_language, class_name: "Appointment", foreign_key: :receiver_language_id
  validates :language, presence: true
  validates :language, uniqueness: { scope: :user, message: "You've already added that language" }
  validates :skill_level, presence: true, numericality: { only_integer: true, less_than_or_equal_to: 5, greater_than_or_equal_to: 1}

  def language_name
    language.name
  end

  def form_input
    "#{self.language.flagcode} #{self.language.name}"
  end
end
