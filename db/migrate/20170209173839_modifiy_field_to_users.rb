class ModifiyFieldToUsers < ActiveRecord::Migration[5.0]
  def up
  	change_column :users, :role, :integer
  end
  def down
  	change_column :users, :role, :text
  end
end
