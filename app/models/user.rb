class User < ActiveRecord::Base
  has_secure_password
  has_many :dogs, foreign_key: :owner, dependent: :destroy
  has_many :requested_bookings, foreign_key: :requester_id, class_name: "Booking", dependent: :destroy
  has_many :booking_requests, foreign_key: :sitter_id, class_name: "Booking", dependent: :destroy
  
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, allow_nil: true, length: {minimum: 8, maximum: 25}
  validates :birthday, presence: true
  # validates :price, numericality: {greater_than_or_equal_to: 0}
  validates :xp_years, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  validates :housing_type, presence: true
  validates :bio, length: {maximum: 750}
  validates :city, presence: true
  validates :state, presence: true
  validates :country, presence: true
  validates :zip_code, presence: true

  validates_format_of :email, with: /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  
  validate :birthday_cant_be_in_the_future, :person_is_at_least_17
  
  def age
    (Date.today - birthday).to_i / 365
  end
  
  def birthday_cant_be_in_the_future
    if birthday.present? && birthday > Date.today
      errors.add(:birthday, "Birthday can't be in the future")
    end
  end
  
  def person_is_at_least_17
    if birthday.present? && birthday > 17.years.ago
      errors.add(:birthday, "Must be older than 17")
    end
  end
end
