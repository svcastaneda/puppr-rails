class Dog < ActiveRecord::Base
  belongs_to :owner, foreign_key: :owner_id, class_name: "User"
  
  validates :name, presence: true
  validates :birthday, presence: true
  validates :breed, presence: true
  validates :size, presence: true
  validates :owner, presence: true
  validates :bio, length: {maximum: 750}
  
  validate :birthday_cant_be_in_the_future
  
  def age
    (Date.today - birthday).to_i / 365
  end
  
  def birthday_cant_be_in_the_future
    if birthday.present? && birthday > Date.today
      errors.add(:birthday, "Birthday can't be in the future")
    end
  end
end
