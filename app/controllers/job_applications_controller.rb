class JobApplicationsController < ApplicationController
    before_action :find_job_application, only: [:edit, :update, :destroy]
    def show
        @job_application = JobApplication.where("job_posting_id = ?", params[:job_posting_id])
        @user = session[:id]
    end
    
    def index 
        # if params[:job_posting_id]
            @user = session[:user_id]
            @job_applications = JobApplication.where("user_id = ?", session[:user_id])
            # @job_applications = JobApplication.where("job_posting_id = ?", params[:job_posting_id])
        # else
        #     @job_applications = JobApplication.where("user_id = ?", session[:user_id])
        #     @user = session[:user_id]
        #     @job_applications.all
        # end
    end

    def new 
        @job_application = JobApplication.new
        @job_posting_id = params[:job_posting_id]
        @user = session[:user_id] 
    end
    
    def edit
        @job_application = JobApplication.find(params[:id])
    end


    def create
        @job_posting_id = JobPosting.find(params[:job_posting_id])
        # job_posting_id = job_application_params(:job_posting_id)[:job_posting_id]
        @job_application = @job_posting_id.job_applications.create!(
            status: "started", 
            user_id: session[:user_id], 
            # job_posting_id: job_posting_id,
            description: params[:description])
            redirect_to job_applications_path
    end


    def update
        @job_application = JobApplication.find(params[:id])
        if @job_application.update(job_application_params)
            redirect_to job_application_path(@job_application)
        else
            render :edit
        end
    end

    private

    def find_job_application
        @job_application = JobApplication.find_by(id: params[:id])
        if @job_application.nil?
          flash[:notice] = "Sorry, incorrect URL"
          redirect_to login_url
        elsif @job_application.user_id != session[:user_id]
          flash[:notice] = "You cannot access this page"
          redirect_to login_url
        end
      end

      

    def job_application_params(*args)
        params.require(:job_application).permit(:status, :user_id, :description)
    end

end
