  class UsersController < ApplicationController
    before_action :logged_in_user, only: [:index, :edit, :update]
    before_action :correct_user, only: [:edit, :update]

  def new
  	@user = User.new
  end

  def show
  	@user = User.find(params[:id])
  end

  def index 
        @users = User.all.paginate(page: params[:page], per_page: 12)
  end 
  
  def create 
  	@user = User.new(user_params) # Not the final implementation! 
  	if @user.save
      log_in @user 
      flash[:success] = "Welcome, #{@user.name} to the Sample App!"
  		redirect_to @user
  	else 
  		render 'new'
  	end 
  end

  def edit 
    @user = User.find_by(params[:id])
  end 
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile Updated"
      redirect_to @user
    else
      render 'edit'
    end
  end 

  def destroy 
   
  end 

  private

  	def user_params
  		params.require(:user).permit(:name, :email, :password, :password_confirmation)
  	end 

    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in"
        redirect_to root_path
      end 
    end

    def correct_user
      @user = User.find(params[:id])
      # redirect_to(root_url) unless current_user?(@user)
      if !current_user?(@user)
        flash[:danger] = "#{@user.name}, you don't have access to this area of the site."
        redirect_to(root_url)    
      else
        # grant access to edit section
     end
   end
end
