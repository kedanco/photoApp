class CommentsController < ApplicationController

  def new
    
  end

  def create
    user = User.find(current_user.id)
    comment_params = params[:comment].permit(:user_id,:photo_id,:text)
    photo = Photo.find(comment_params[:photo_id])
    @comment = Comment.new(comment_params)

      if @comment.save
        flash[:success] = "Comment successfully added!"
      else
        flash[:warning] = "There was an error adding your comment."

      end
    redirect_to album_photo_path(album_id: photo.album_id, id: photo.id)
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    comment_params = params[:comment].permit(:user_id,:photo_id,:text)
    comment = Comment.find(params[:id])
    photo = Photo.find(comment.photo_id)
    if comment.update(comment_params)
        flash[:success] = "Comment successfully updated!"
        redirect_to album_photo_path(album_id: photo.album_id, id:photo.id)
      else
        flash[:warning] = "There was a problem updating your comment."
        render :edit
      end

  end

  def destroy
    @comment = Comment.find(params[:id])
    photo = Photo.find(@comment.photo_id)
    @comment.destroy
    flash[:success] = "Comment deleted!"
    redirect_to album_photo_path(album_id: photo.album_id, id:photo.id)

  end


end
