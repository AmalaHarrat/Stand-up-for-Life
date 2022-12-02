class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :missions
  has_many :bookings

  has_one_attached :photo

  validates :firstname, presence: true

  def badge
    Badge.where("threshold > ?", total_score).first
  end

  def total_score
    # A calculer : incrementation
    100
  end

  def past_missions
    self.bookings.map(&:mission).select(&:past?)
    # self.bookings.map{|booking| booking.mission}.select{ |mission| mission.past?}
  end

  def futur_missions
    self.bookings.map(&:mission).reject(&:past?)
  end
end
