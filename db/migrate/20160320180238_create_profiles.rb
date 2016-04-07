class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.references  :user, null: false
      t.string      :picture
      t.boolean     :sitter, null: false, default: true
      t.string      :housing_type
      t.integer     :xp_years, default: 0
      t.decimal     :price
      t.text        :bio
      t.string      :address_line_1
      t.string      :address_line_2
      t.string      :city
      t.string      :state
      t.string      :country, null: false, default: "USA"
      t.string      :zip_code
      
      t.timestamps(null: false)
    end
  end
end
