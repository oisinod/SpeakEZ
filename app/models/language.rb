class Language < ApplicationRecord
  has_many :user_languages, dependent: :destroy
  validates :name, presence: true
end
