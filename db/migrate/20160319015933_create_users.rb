class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string      :first_name, null: false
      t.string      :last_name, null: false
      t.string      :email, null: false
      t.string      :username, null: false
      t.string      :password_digest, null: false
      t.date        :birthday, null: false
      t.decimal     :price
      t.integer     :xp_years
      t.string      :housing_type, null: false
      t.text        :bio
      t.boolean     :sitter, null: false, default: true
      t.string      :address
      t.string      :city, null: false
      t.string      :state, null: false
      t.string      :country, null: false
      t.string      :zip_code, null: false
      
      t.timestamps(null: false)
    end
  end
end
