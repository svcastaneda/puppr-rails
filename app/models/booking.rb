class Booking < ActiveRecord::Base
  belongs_to :sitter, foreign_key: :sitter_id, class_name: "User"
  belongs_to :user, foreign_key: :requester_id, class_name: "User"
end
