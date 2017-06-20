class UpdateArtworksUnique2 < ActiveRecord::Migration[5.0]
  def change
    remove_index :artworks, :image_url
    add_index(:artworks, [:title, :artist_id], unique: true)
  end
end
