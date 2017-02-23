class CreateAlbums < ActiveRecord::Migration[5.0]
  def change
    create_table :albums do |t|
      t.string :title,	null:false
      t.text :description
      t.belongs_to :user, index: true
      t.timestamps
    end
  end
end
