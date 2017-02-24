class AddHouseimagesToLocations < ActiveRecord::Migration[5.0]
  def change
    add_column :locations, :houseimages, :json
  end
end
