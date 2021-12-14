class BookmarksController < ApplicationController
  def new
    @list = List.find(params[:id])
    @bookmark = Bookmark.new
    @bookmark.list = @list
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = List.find(params[:id])
    if @bookmark.save
      redirect_to lists_path(@bookmark.list)
    else
      render :new
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:list_id, :movie_id, :comment)
  end
end
