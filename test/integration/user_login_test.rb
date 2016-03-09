require 'test_helper'

class UserLoginTest < ActioDispatch::IntegrationTest

	def setup
		@user = users(:michael)
	end 

	test "login with valid information" do 
		get login_path
		post login_path, sessio: {email: @user.email, password: 'password' }
		assert_redirected to @user
		follow_redirect!
		assert_template 'users/show'
   		assert_select "a[href=?]", login_path, count: 0
  		assert_select "a[href=?]", logout_path
	    assert_select "a[href=?]", user_path(@user)
  end
end