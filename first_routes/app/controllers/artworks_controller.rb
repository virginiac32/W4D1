class ArtworksController < ApplicationController
  def index
    @artworks = Artwork.all
    render json: @artworks
  end

  def create
    @artwork = Artwork.new(artwork_params)
    if @artwork.save
      render json: @artwork
    else
      render(
        json: @artwork.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def update
    artwork = selected_artwork
    if artwork.update(artwork_params)
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    artwork = selected_artwork
    if artwork.destroy
      render json: artwork
    else
      render json: "Cannot destroy artwork"
    end
  end

  def show
    artwork = selected_artwork
    render json: artwork
  end

  private

  def selected_artwork
    Artwork.find_by(id: params[:id])
  end

  def artwork_params
    params.require(:artwork).permit(:title, :image_url, :artist_id)
  end
end
