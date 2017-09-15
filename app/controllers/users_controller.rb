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
  end
 
 end