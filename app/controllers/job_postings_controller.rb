class JobPostingsController < ApplicationController
    # before_action :find_job, only: [:show]

    def index
        @user = User.find(session[:user_id])
        @job_postings = JobPosting.all
    end

    def show
        @user = User.find(session[:user_id])
        @job_posting = JobPosting.find(params[:id])
    end
    
    
    private

    def find_job
        @job_posting = JobPosting.find(params[:id])
    end

end
