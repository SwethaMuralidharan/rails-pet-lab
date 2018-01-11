class Pet < ActiveRecord::Base
  # TODO: associate with owner
  belongs_to :owner
  # TODO: associate with appointments
  has_many :appointments
  # TODO: validate name and breed
  validates :name,presence: true,length:{ maximum: 255 }
  validates :breed,presence: true
  validates :date_of_birth,presence: true
  validate :date_of_birth_cannot_be_in_the_future

  # adds an error if birth date is in the future
  def date_of_birth_cannot_be_in_the_future
    if date_of_birth.present? && date_of_birth > Date.today
      errors.add(:date_of_birth, "cannot be in the future")
    end
  end

  # calculates age of pet in years
  def age
    if date_of_birth.nil?
      nil
    else
      (DateTime.now.to_date-date_of_birth)/365
    end
  end

end
