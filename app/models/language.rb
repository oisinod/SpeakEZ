class Language < ApplicationRecord
  has_many :user_languages
  validates :name, presence: true
end
