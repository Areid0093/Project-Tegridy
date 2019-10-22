class JobApplicationsController < ApplicationController

    def show
        @job_application = JobApplication.find(params[:id])
    end

    def index 
        @job_applications = JobApplication.all 
    end

    def new 
        @job_application = JobApplication.new
    end
    
    def edit
        @job_application = JobApplication.find(params[:id])
    end

    def create 
        @job_application = JobApplication.new(job_application_params)
        if @job_application.save
            redirect_to job_application_path(@job_application)
        else
            render :new
        end
    end

    def create 
        @job_application = JobApplication.new(job_application_params)
        if @job_application.save
            redirect_to job_application_path(@job_application)
        else
            render :edit
        end
    end


    private

    def job_application_params
        params.require(:job_application).permit(:status, :user_id, :job_posting_id, :description)
    end

end
