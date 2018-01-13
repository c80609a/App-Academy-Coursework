class ArtworksController < ApplicationController
    def create
      @artwork = Artwork.new(artwork_params)
      if @artwork.save
        render json: @artwork
      else
        render json: @artwork.errors.full_messages, status: :unprocessable_entity
      end
    end

    def show
      @artwork = Artwork.find(params[:id])
      if @artwork
        render json: @artwork
      else
        render json: @artwork.errors.full_messages, status: 404
      end
    end

    def index
      @artworks = Artwork.all
      render json: @artworks
    end

    def update
      @artwork = Artwork.find(params[:id])
      if @artwork.update(artwork_params)
        render json: @artwork
      else
        render json: @artwork.errors.full_messages, status: 422
      end
    end

    def destroy
      @artwork = Artwork.find(params[:id])
      if @artwork.destroy
        render json: @artwork
      else
        render text: "Object not destroyed, did not exist"
      end
    end
    
    private
    def artwork_params
      params.require(:artworks).permit(:id, :title, :img_url, :artist_id)
    end
end
