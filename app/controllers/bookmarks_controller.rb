class BookmarksController < ApplicationController
#     before_action :find_bookmark, only: [:show, :edit, :update, :destroy]
#     def show
#         @bookmark = Bookmark.find(params[:id])
#     end
#     def index 
#         @bookmarks = Bookmark.where("user_id = ?", session[:user_id])
#         @user = session[:user_id]
#     end
#     def new 
#         @bookmark = Bookmark.new
#     end
    
#     def edit
#         @bookmark = Bookmark.find(params[:id])
#     end


#         def create
#             job_posting_id = bookmark_params(:job_posting_id)[:job_posting_id]
#             @bookmark = Bookmark.create(
#               user_id: session[:user_id], 
#               job_posting_id: job_posting_id)
#             redirect_to bookmarks_path
#           end


#     def update
#         @bookmark = Bookmark.find(params[:id])
#         if @bookmark.update(bookmark_params)
#             redirect_to bookmark_path(@bookmark)
#         else
#             render :edit
#         end
#     end

#     private

#     def find_bookmark
#         @bookmark = Bookmark.find_by(id: params[:id])
#         if @bookmark.nil?
#           flash[:notice] = "Sorry, incorrect URL"
#           redirect_to login_url
#         elsif @bookmark.user_id != session[:user_id]
#           flash[:notice] = "You cannot access this page"
#           redirect_to login_url
#         end
#       end

#     def bookmark_params(*args)
#         params.require(:bookmark).permit(:user_id, :job_posting_id)
#     end
end
