class Mission < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :title, :description, :category, :city, :max_participant, :duration, :date, presence: true
  validates :description, length: { minimum: 10 }
end
