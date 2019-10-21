class BookmarksController < ApplicationController

    def index
        @bookmarks = Bookmark.all 
    end

    def show
        @bookmark = Bookmark.find(params[:id])
    end

    def new
        @bookmark = Bookmark.new
    end

    def destroy
        @bookmark = Bookmark.find(params[:id])
        @bookmark.destroy
        redirect_to bookmark_path(@bookmark)
    end
end
