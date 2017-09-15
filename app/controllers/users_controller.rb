class UsersController < ApplicationController
    def index
    end

    def show
      user = User.find(current_user.id)
      @albums = user.albums.all
      @others = User.all
      render :show
    end

end

