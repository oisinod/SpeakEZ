class UserLanguage < ApplicationRecord
  belongs_to :user
  belongs_to :language
  validates :language, presence: true
  validates :language, uniqueness: { scope: :user, message: "You already have that language" }
  validates :skill_level, presence: true, numericality: { only_integer: true, less_than_or_equal_to: 5, greater_than_or_equal_to: 1}

  def language_name
    language.name
  end
end
