class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :missions
  has_many :bookings
  # has_one :badge

  has_one_attached :photo

  validates :firstname, presence: true
  validates :firstname, uniqueness: true

  def badge
    Badge.where("threshold > ?", total_score).first
  end

  def total_score
    # METHODE CLASSIQUE
    # self.bookings.map do |booking|
    #   booking.scoring
    # end.sum
    # METHODE SIMPLIFIEE
    bookings.map(&:scoring).reject(&:nil?).sum.to_i
    # METHODE SIMPLIFIEE ++
    # self.bookings.map(&:scoring).compact.sum.to_i
  end

  def past_missions
    bookings.map(&:mission).select(&:past?)
    # self.bookings.map{|booking| booking.mission}.select{ |mission| mission.past?}
  end

  def futur_missions
    bookings.map(&:mission).reject(&:past?)
  end
end
