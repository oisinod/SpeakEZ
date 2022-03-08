class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :user_languages, dependent: :destroy
  has_many :appointments_as_asker, through: :user_languages, source: :appointments_as_asker_language
  has_many :appointments_as_receiver, through: :user_languages, source: :appointments_as_receiver_language
  has_many :languages, through: :user_languages
  has_many :messages
  has_one_attached :photo
  validates :username, presence: true, uniqueness: true
  validates :first_name, :last_name, :phone, :nationality, :age, :location, presence: true
  validates :age,  numericality: { only_integer: true }
  validates :bio, length: { minimum: 5, maximum: 1000 }, allow_blank: true

end
