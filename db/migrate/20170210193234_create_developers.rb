class CreateDevelopers < ActiveRecord::Migration[5.0]
  def change
    create_table :developers do |t|
	t.integer :experience
	t.string :interests
    t.timestamps
    end
  end
end
