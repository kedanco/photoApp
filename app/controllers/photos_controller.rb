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

      if photo.save
        flash[:success] = "Photo successfully saved!"
        redirect_to album_photo_path(album_id: album.id,id: photo.id)
      else
        flash[:warning] = "There was a problem adding your photo."
        render :new
      end
    end

    def show
      @photo = Photo.find(params[:id])
      @comments = @photo.comments.all
      @comment = @photo.comments.new
      album = Album.find(@photo.album_id)
      @user = User.find(album.user_id)
      
    end

    def edit
      @photo = Photo.find(params[:id])
    end

    def update
      photo_params = params[:photo].permit(:caption)

      photo = Photo.find(params[:id])

      if photo.update(photo_params)
        flash[:success] = "Photo successfully updated!"
        redirect_to album_photo_path(album_id: photo.album_id, id:photo.id)
      else
        flash[:warning] = "There was a problem updating your photo."
        render :edit
      end

    end

    def destroy
      @photo = Photo.find(params[:id])
      flash[:success] = "Photo '#{@photo.caption}' successfully deleted"
      albumid = @photo.album_id
      @photo.destroy
      redirect_to album_path(id: albumid)
    end
end
