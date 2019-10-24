class ApplicationController < ActionController::Base
    helper_method :current_user
    helper_method :company
   

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      @current_user = nil
    end
    
  end 

  def company 
    @company = JobPosting.find_by_company(params[:company])
  end
  
end



