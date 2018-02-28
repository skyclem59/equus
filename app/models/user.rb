class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :horses, dependent: :destroy
  has_many :bookings, dependent: :destroy

  # Implémenter méthode horses_booked pour connaitre la liste des chevaux que le user a loué
end
