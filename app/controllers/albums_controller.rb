class AlbumsController < ApplicationController

    def show
      @album = Album.find(params[:id])
    end

    def new
      @album = Album.new
    end

    def create
      album_params = params[:album].permit(:title,:description)
      user = User.find(current_user.id)
      album = user.albums.new(album_params)

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

    def edit
    end

    def update
    end

    def destroy
      @album = Album.find(params[:id])
      flash[:success] = "Album '#{@album.title}' successfully deleted"
      @album.destroy
      redirect_to user_path(current_user.id)
    end

end
