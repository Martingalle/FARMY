class Machine < ApplicationRecord
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  has_many :bookings, dependent: :destroy
  belongs_to :user
  validates :make, inclusion: {in: ["Massey-Ferguson", "New Holland", "International", "Bobard", "McCormick", "Kobatsu", "Manitou", "John Deere", "Deutz-Fahr", "Someca"]}, presence: true
  validates :year, inclusion: {in: (1990..2018)}, presence: true
  validates :min_hours, presence: true
  validates :category, inclusion: {in: ["Tractor","Combine Harvester","Sower","Sprayer","Shredder","Spreader","Rolls","Sidewinder","Vineyard Tractor"]}, presence: true
  validates :location, presence: true
  validates :price_per_hour, presence:true, numericality: true
  mount_uploader :photo, PhotoUploader

  include AlgoliaSearch

  algoliasearch per_environment: true do
    attribute :location, :category, :make, :photo, :id, :price_per_hour
  end
end
