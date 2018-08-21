class Machine < ApplicationRecord
  validates :make, inclusion: {in: ["Massey-Ferguson", "New Holland", "International", "Bobard", "McCormick", "Kobatsu", "Manitou", "John Deere", "Deutz-Fahr", "Someca"]}, presence: true
  validates :year, inclusion: {in: [1950..2018]}, presence: true
  validates :category, inclusion: {in: ["tractor","combine harvester","sower","sprayer","shredder","spreader","rolls","sidewinder","vineyard tractor"]}, presence: true
  validates :force_moteur, presence: true
  validates :location, presence: true
  has_many :bookings, dependent: :destroy
  belongs_to :user
  mount_uploader :photo, PhotoUploader
end
