class ApplicationController < ActionController::Base
    helper_method :current_user
    helper_method :company
    helper_method :logged_in?
    helper_method :signed_in
   

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      @current_user = nil
    end
    
  end 

  def logged_in?
    User.find_by(id: session[:user_id]) ? true : false
  end

  def signed_in
    if @signed_in
        @signed_in.try(:username)
    else
        @signed_in = User.find_by(id: session[:user_id])
        @signed_in.try(:username)
    end
  end

  def company 
    @company = JobPosting.find_by_company(params[:company])
  end
  
end



