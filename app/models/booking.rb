class Booking < ActiveRecord::Base
  belongs_to :sitter, foreign_key: :sitter_id, class_name: "User"
  belongs_to :requester, foreign_key: :requester_id, class_name: "User"
  
  validates :sitter_id, presence: true
  validates :requester_id, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  
  validate booking_cant_start_in_the_past, booking_cant_end_in_the_past, booking_cant_start_before_it_ends
  
  def booking_cant_start_in_the_past
    if start_date.present? && start_date < Date.today
      errors.add(:start_date, "Start date can't be in the past")
    end
  end
  
  def booking_cant_end_in_the_past
    if end_date.present? && end_date < Date.today
      errors.add(:end_date, "End date can't be in the past")
    end
  end
  
  def booking_cant_start_before_it_ends
    if start_date.present? && start_date > end_date
      errors.add(:start_date, "Booking can't start before it ends")
    end
  end
end
