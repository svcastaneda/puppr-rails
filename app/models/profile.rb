class Profile < ActiveRecord::Base
  belongs_to :user
  has_many :dogs, through: :user
  has_many :booking_requests, through: :user
  has_many :requested_bookings, through: :user
  

  # validates :price, numericality: {greater_than_or_equal_to: 0}
  validates :xp_years, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  # validates :housing_type, presence: true
  validates :bio, length: {maximum: 750}
  # validates :city, presence: true
  # validates :state, presence: true
  # validates :country, presence: true
  # validates :zip_code, presence: true
end
