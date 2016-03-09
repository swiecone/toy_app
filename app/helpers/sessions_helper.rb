module SessionsHelper 
	# Logs in the given user 
	def log_in(user)
		session[:user_id] = user.user_id
	end 
end 
