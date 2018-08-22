class Machine < ApplicationRecord
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  validates :make, inclusion: {in: ["Massey-Ferguson", "New Holland", "International", "Bobard", "McCormick", "Kobatsu", "Manitou", "John Deere", "Deutz-Fahr", "Someca"]}, presence: true
  validates :year, inclusion: {in: (1990..2018)}, presence: true
  validates :category, inclusion: {in: ["Tractor","Combine Harvester","Sower","Sprayer","Shredder","Spreader","Rolls","Sidewinder","Vineyard tractor"]}, presence: true
  validates :location, presence: true
  has_many :bookings, dependent: :destroy
  validates :price_per_hour, presence:true, numericality: true
  belongs_to :user
  mount_uploader :photo, PhotoUploader
end
