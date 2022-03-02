class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :appointments_as_asker, class_name: "Appointment", foreign_key: :asker_id
  has_many :appointments_as_receiver, class_name: "Appointment", foreign_key: :receiver_id
  has_many :user_languages, dependent: :destroy
  has_many :messages
  validates :username, presence: true, uniqueness: true
  validates :first_name, :last_name, :phone, :nationality, :age, :location, presence: true
  validates :age,  numericality: { only_integer: true }
end
