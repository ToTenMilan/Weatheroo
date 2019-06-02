class AddUidToUserCities < ActiveRecord::Migration[5.2]
  def change
    add_column :user_cities, :uid, :integer
    add_index :user_cities, :uid
  end
end
