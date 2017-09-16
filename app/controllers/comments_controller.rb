class CommentsController < ApplicationController

  def new
    
  end

  def create
    user = User.find(current_user.id)
    comment_params = params[:comment].permit(:user_id,:photo_id,:text)
    photo = Photo.find(comment_params[:photo_id])
    @comment = Comment.new(comment_params)

      if @comment.save
        flash[:success] = "Comment successfully created!"

      else
        flash[:warning] = "There was an error adding your comment."

      end
    redirect_to album_photo_path(album_id: photo.album_id, id: photo.id)
  end

  def edit

  end

  def update

  end

  def destroy
    @comment = Comment.find(params[:id])
    photo = Photo.find(@comment.photo_id)
    @comment.destroy
    
    redirect_to album_photo_path(album_id: photo.album_id, id:photo.id)

  end


end
