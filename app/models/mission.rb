class Mission < ApplicationRecord
  belongs_to :user
  has_many :bookings

  has_one_attached :photo

  validates :title, :description, :category, :city, :max_participant, :duration, :date, presence: true
  validates :description, length: { minimum: 10 }
  # validate :expiration_date_cannot_be_in_the_past
  # validate :user_an_organisation?, on: :create

  # Ceci est une validation custom
  # Elle permet de creer une mission QUE si organisme = true
  # def user_an_organisation?
  #   user = User.find(user_id)
  #   unless user.organisme
  #     errors.add(:organisme, "Désolé, vous ne pouvez pas creer de mission...")
  #     return false
  #   end
  #   return true
  # end

  # def expiration_date_cannot_be_in_the_past
  #   expiration_date = Mission.find()
  #   if expiration_date.present? && expiration_date < Date.today
  #     errors.add(:expiration_date, "Oups! la date est dans le passé...")
  #   end
  # end
end
