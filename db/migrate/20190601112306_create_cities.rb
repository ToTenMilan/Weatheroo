class CreateCities < ActiveRecord::Migration[5.2]
  def change
    create_table :cities do |t|
      t.integer :uid
      t.string :name
      t.string :country
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
    add_index :cities, :uid, unique: true
  end
end
