class ChangeTableLocations < ActiveRecord::Migration[5.0]
  def up
  	change_column :locations, :singleroom, :boolean
  	change_column :locations, :sharedroom, :boolean
  	change_column :locations, :surfspot, :boolean
  	change_column :locations, :barbecue, :boolean
  	change_column :locations, :villa, :boolean
  	change_column :locations, :swimmingpool, :boolean
  	change_column :locations, :skiresort, :boolean
  end
  def down
  	change_column :locations, :singleroom, :integer
  	change_column :locations, :sharedroom, :integer
  	change_column :locations, :surfspot, :integer
  	change_column :locations, :barbecue, :integer
  	change_column :locations, :villa, :integer
  	change_column :locations, :swimmingpool, :integer
  	change_column :locations, :skiresort, :integer
  end  	
end
