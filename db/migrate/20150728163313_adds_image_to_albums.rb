class AddsImageToAlbums < ActiveRecord::Migration
  def change
    add_column :albums, :image, :string
  end
end