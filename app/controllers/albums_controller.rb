class AlbumsController < ApplicationController

    def show
      @album = Album.find(params[:id])
    end

    def new
      @album = Album.new(user_id: params[:id])
    end

    def create
      album_params = params[:album].permit(:title,:description)
      album = Album.new(album_params)

      if album.save
          redirect_to album_path(id: album.id)
          flash[:success] = "Album Created!"
      else
          if album.title == ""
            flash[:warning] = "Please enter a valid name for the Album!"
          end
          redirect_to new_album_path
      end
    end

end
