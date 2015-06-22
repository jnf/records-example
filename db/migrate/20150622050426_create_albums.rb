class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :title
      t.integer :label_id
      t.integer :artist_id
      t.string :released_year
      t.string :format
      t.string :label_code
      t.timestamps null: false
    end
  end
end
