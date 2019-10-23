class JobPostingsController < ApplicationController

    def index
        @job_postings = JobPosting.all
        @user = session[:user_id]
    end

    def show
        @job_posting = JobPosting.find(params[:id])
    end

end
