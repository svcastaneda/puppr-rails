class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.integer  :sitter_id, null: false
      t.integer  :requester_id, null: false
      t.date     :start_date, null: false
      t.date     :end_date, null: false
      t.boolean  :approved, null: false, default: false
      
      t.timestamps(null: false)
    end
  end
end
