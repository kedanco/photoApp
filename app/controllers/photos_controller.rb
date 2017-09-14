class PhotosController < ApplicationController
    def index
    end

    def new
        @album = Album.find(params[:album_id])
        @photo = @album.photos.new
    end

    def create
      album = Album.find(params[:album_id])

      photo_params = params[:photo].permit(:caption, :image)

      photo = album.photos.new(photo_params)

      photo.save

      redirect_to album_photo_path(album_id: album.id,id: photo.id)
    end

    def show
      @photo = Photo.find(params[:id])
    end
end
