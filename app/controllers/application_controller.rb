class ApplicationController < ActionController::Base
  before_action :set_user
  before_action :authorized

  def set_user
    @logged_in_user = User.find_by(id: session[:user_id])
  end 

  def authorized
    if @logged_in_user
    
    else
      flash[:error] = "You must login or signup to view this page!"
      redirect_to new_login_path
    end 
  end

end
