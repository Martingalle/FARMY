class Booking < ApplicationRecord
  belongs_to :machine
  belongs_to :customer, class_name: 'User', foreign_key: 'user_id'
  validates :price, presence: true
  validates :duration, presence: true
end
    