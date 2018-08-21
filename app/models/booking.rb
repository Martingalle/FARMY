class Booking < ApplicationRecord
  belongs_to :machine
  belongs_to :user
  validates: :price, presence: true
  validates: :duration, presence: true
end
