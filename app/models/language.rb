class Language < ApplicationRecord
  has_many :user_languages, dependent: :destroy
  has_many :users, through: :user_languages
  validates :name, presence: true

  def form_input
    "#{self.flagcode} #{self.name}"
  end
end
