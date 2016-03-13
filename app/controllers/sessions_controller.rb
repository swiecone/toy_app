class SessionsController < ApplicationController
  def new
  end

  def create 
  	user = User.find_by(email: params[:session][:email].downcase)
  		if user && user.authenticate(params[:session][:password])
        log_in user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        flash[:success] =  "#{user_name}, welcome to Sample App!" # Not quite right! 
        redirect_to user 
  		else 
			flash[:danger] = 'Invalid email/password combination' # Not quite right! 
  			render 'new'
  		end
  end 

  def destroy
    log_out if logged_in?
     flash[:success] = "You have successfuly logged out!"
    redirect_to root_url
  end 

end