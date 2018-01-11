class Owner < ActiveRecord::Base
  # TODO: add association ot pets
  has_many :pets
  # TODO: add association to appointments (through pets)

  # TODO: add validations

  before_save :normalize_phone_number
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :first_name,presence: true,length:{ maximum: 255 }
  validates :last_name,presence: true,length:{ maximum: 255 }
  validates :email,presence: true,length:{ maximum: 255 },uniqueness: true,format:{ with: /@/, message:"must include @" }

  # removes leading 1 and the characters (, ), -, .
  def normalize_phone_number
    if phone.present?
     phone.gsub!(/^1/, "")
     phone.gsub!(/[()-.]/,"")
   end
  end

end
