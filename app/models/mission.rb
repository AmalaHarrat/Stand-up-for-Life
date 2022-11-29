class Mission < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :title, :description, :category, :city, :max_participant, :duration, :date, presence: true
  validates :description, length: { minimum: 10 }
  validate :user_an_organisation?, on: :create

  # Ceci est une validation custom
  # Elle permet de creer une mission QUE si organisme = true
  def user_an_organisation?
    user = User.find(user_id)
    unless user.organisme
      errors.add(:organisme, "Désolé, vous ne pouvez pas creer de mission...")
      return false
    end
    return true
  end
end
