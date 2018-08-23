class Machine < ApplicationRecord
  geocoded_by :location
  has_many :bookings, dependent: :destroy
  belongs_to :user
  after_validation :geocode, if: :will_save_change_to_location?
  validates :make, inclusion: {in: ["Massey-Ferguson", "New Holland", "International", "Bobard", "McCormick", "Kobatsu", "Manitou", "John Deere", "Deutz-Fahr", "Someca"]}, presence: true
  validates :year, inclusion: {in: (1990..2018)}, presence: true
  validates :min_hours, presence: true
  validates :category, inclusion: {in: ["Tractor","Combine Harvester","Sower","Sprayer","Shredder","Spreader","Rolls","Sidewinder","Vineyard Tractor"]}, presence: true
  validates :location, presence: true
  validates :price_per_hour, presence:true, numericality: true
  mount_uploader :photo, PhotoUploader

  # include PgSearch
  #   pg_search_scope :search_by,
  #     against: [ :make, :location, :category ],
  #     using: {
  #       tsearch: {
  #         prefix: true,
  #         negation: true,
  #         highlight: {
  #                 start_sel: '<b>',
  #                 stop_sel: '</b>',
  #               }
  #       } # <-- now `superman batm` will return something!
  #     }

  include AlgoliaSearch

  algoliasearch per_environment: true do
    attribute :location, :category, :make, :photo
  end
end
