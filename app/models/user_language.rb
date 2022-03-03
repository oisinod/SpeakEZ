class UserLanguage < ApplicationRecord
  belongs_to :user
  belongs_to :language
  validates :language, presence: true
  validates :language, uniqueness: { scope: :user, message: "You already have that language" }
  validates :skill_level, presence: true, numericality: { only_integer: true }

  def language_name
    language.name
  end
end
