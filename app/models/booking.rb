class Booking < ActiveRecord::Base
  belongs_to :sitter, foreign_key: :sitter_id, class_name: "User"
  belongs_to :requester, foreign_key: :requester_id, class_name: "User"
  
  validates :sitter_id, presence: true
  validates :requester_id, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  
end
