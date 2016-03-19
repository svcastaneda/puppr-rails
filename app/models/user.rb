class User < ActiveRecord::Base
  has_secure_password
  has_many :dogs, foreign_key: :owner
  has_many :bookings
  
  def age
    (Date.today - birthday).to_i / 365
  end
end
