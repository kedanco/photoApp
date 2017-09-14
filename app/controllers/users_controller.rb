class UsersController < ApplicationController
    def index
    end

    def show
      user = User.find(params[:id])
      @albums = user.albums.all
      @others = User.all
      render :show
    end

end

