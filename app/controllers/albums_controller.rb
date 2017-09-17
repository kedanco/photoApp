class AlbumsController < ApplicationController

    def show
      @album = Album.find(params[:id])
      @user = User.find(@album.user_id)
      @photos = @album.photos.all
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
      @album = Album.find(params[:id])
    end

    def update
      album_params = params[:album].permit(:title, :description)
      @album = Album.find(params[:id])
        if @album.update(album_params)
          flash[:success] = "Album successfully updated!"
          redirect_to album_path(id: @album.id)
        else
          flash[:warning] = "There was an error updating Album."
          render :edit
        end
    end

    def destroy
      @album = Album.find(params[:id])
      flash[:success] = "Album '#{@album.title}' successfully deleted"
      @album.destroy
      redirect_to user_path(current_user.id)
    end

end
