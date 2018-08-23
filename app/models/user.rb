class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :machines, dependent: :destroy
  has_many :owner_bookings, through: :machines, source: :bookings, dependent: :destroy
  has_many :customer_bookings, class_name: "Booking"

  validates :name, presence: true
  mount_uploader :photo, PhotoUploader
end
