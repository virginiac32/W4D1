class UpdateArtworksUnique < ActiveRecord::Migration[5.0]
  def change
    remove_index :artworks, :image_url
    add_index :artworks, :image_url, unique: true
  end
end
