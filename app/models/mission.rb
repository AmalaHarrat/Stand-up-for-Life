class Mission < ApplicationRecord
  belongs_to :user
  has_many :bookings

  has_many_attached :photos

  validates :title, :description, :category, :city, :max_participant, :duration, :date, presence: true
  validates :description, length: { minimum: 3 }
  validates :city, format: { with: /[a-zA-Z]/ }
  validate :validate_images
  validate :validate_upload_size

  geocoded_by :address_from_components
  after_validation :geocode, if: :will_save_change_to_address?

  def address_from_components
    "#{address}, #{city}"
  end
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

  def past?
    date < Date.today
  end

  def progress
    if past?
      return :past
    else
      return :futur
    end
  end

  private

  def validate_images
    return if photos.count <= 5

    errors.add(:photos, 'Vous pouvez télécharger que 5 photos maximum')
  end

  def validate_upload_size
    photos.each do |photo|
      if photo.blob.byte_size > 10.megabytes
        errors.add(:photos, "La taille de la photo #{photo.blob.filename} est trop grande")
      end
    end
  end
end
