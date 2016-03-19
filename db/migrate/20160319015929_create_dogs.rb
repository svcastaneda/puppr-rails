class CreateDogs < ActiveRecord::Migration
  def change
    create_table  :dogs do |t|
      t.string      :name, null: false
      t.date        :birthday, null: false
      t.string      :breed, null: false
      t.string      :size, null: false
      t.text        :bio
      t.references  :owner, null: false
      
      t.timestamps(null: false)
    end
  end
end
