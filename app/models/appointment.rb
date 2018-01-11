class Appointment < ApplicationRecord
  belongs_to :pet
  validates :veterinarian,presence:true,length:{maximum:255}
  validates :reason,presence:true
  validates :time,presence:true
end
