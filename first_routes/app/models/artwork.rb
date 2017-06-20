class Artwork < ApplicationRecord
  validates :title, presence: true, uniqueness: {scope: :artist_id, message: 'Artist cannot have two artworks of the same title'}
  validates :artist_id, presence: true

  belongs_to :artist,
    class_name: 'User',
    primary_key: :id,
    foreign_key: :artist_id

  has_many :shares,
    primary_key: :id,
    foreign_key: :artwork_id,
    class_name: 'ArtworkShare'

  has_many :shared_viewers,
    through: :shares,
    source: :viewer
end
