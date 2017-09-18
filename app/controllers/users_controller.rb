class UsersController < ApplicationController

  def index
    @user = User.find(current_user.id)
    @others = User.where.not(id: current_user.id)
  end

  def show
    if params[:id] == nil
      @user = User.find(current_user.id)
    else
      @user = User.find(params[:id])
    end
    @albums = @user.albums.all


    # album photos
    @firstPhotos = []

    #access each album, put photo into firstPhotos
    @albums.each do |album|
      if album.photos.empty?
        @firstPhotos << '../greybg.png'

      else
        @firstPhotos << album.photos.first.image.thumb.url
      end
    end

  end 

 end
