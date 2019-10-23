class BookmarksController < ApplicationController
    
    def build 
        @job_posting = JobPosting.find_by((params[:job_posting_id]))
        @user = current_user
        @job_posting.users << @user
        redirect_to :back
    end

    def index
        @bookmarks = Bookmark.all 
    end

    def show
        @bookmark = Bookmark.find(params[:id])
    end

    def new
        @bookmark = Bookmark.new
    end

    def create
        @bookmark = Bookmark.new
        @bookmark.save
    end

    def destroy
        @bookmark = Bookmark.find(params[:id])
        @bookmark.destroy
        redirect_to bookmark_path(@bookmark)
    end



end
