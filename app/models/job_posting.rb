class JobPosting < ApplicationRecord
    has_many :job_applications
    has_many :users, through: :job_applications
    has_many :bookmarks
    has_many :job_posting_filters
    has_many :filters, through: :job_posting_filters


    def initialize_search
        @job_postings = JobPosting.alphabetical
        session[:search_name] ||= params[:search_name]
        session[:filter] = params[:filter]
        params[:filter_option] = nil if params[:filter_option] == ""
        session[:filter_option] = params[:filter_option]
      end
    
      def handle_search_name
        if session[:search_name]
          @filters = Filter.where("name LIKE ?", "%#{session[:search_name].titleize}%")
          @job_postings = @job_postings.where(code: @filters.pluck(:job_posting))
        else
          @filters = Filter.all
        end
      end
    
      def handle_filters
        if session[:filter_option] && session[:filter] == "position"
          @filters = @filters.where(position: session[:filter_option])
          @job_postings = @job_postings.where(code: @filters.pluck(:job_posting))
        elsif session[:filter_option] && session[:filter] == "industry"
          @job_postings = @job_postings.where(code: session[:filter_option])
        end
      end
    
end
