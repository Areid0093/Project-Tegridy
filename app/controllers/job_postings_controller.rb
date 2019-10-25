class JobPostingsController < ApplicationController
    # before_action :find_job, only: [:show]
    include JobPostingsHelper
    def index
        @user = User.find(session[:user_id])
        @job_postings = JobPosting.all
      end

    def show
        @user = User.find(session[:user_id])
        @job_posting = JobPosting.find(params[:id])
    end

    def advanced_search
        @search = ransack_params
        @search.build_grouping unless @search.groupings.any?
        @job_postings  = ransack_result
      end
    
    
    private

    def find_job
        @job_posting = JobPosting.find(params[:id])
    end

    def ransack_params
        JobPosting.includes(:users).ransack(params[:q])
      end
  
      def ransack_result
        @search.result(distinct: job_posting_wants_distinct_results?)
      end

end
