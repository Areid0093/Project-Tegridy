class FiltersController < ApplicationController

    def index
        handle_search_name
        handle_filters
    end

    def show
        @filter = Filter.find(params[:id])
    end

    private

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
