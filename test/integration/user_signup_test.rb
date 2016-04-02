require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "valid signup information" do
    get signup_path
    assert_difference 'User.count', 1 do
      post_via_redirect users_path, user: { name:  "Example User",
                                            email: "user@example.com",
                                            password:              "password",
                                            password_confirmation: "password" }
    end
    assert_template 'users/show'
    assert is_logged_in?
  end

   test "valid insignup information" do
    get signup_path
    assert_difference 'User.count' do
      post users_path, user: { name:  "",
                                            email: "user@example",
                                            password:              "foo",
                                            password_confirmation: "bar" }
    end
    assert_template 'users/new'
  end

  test "login with invalid information" do 
    get login_path
    assert_template 'session/new'
    post login_path, session: {email: "", password: "" }
    assert_template 'session/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end 
  
   test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, user: { name:  "",
                               email: "user@invalid",
                               password:              "foo",
                               password_confirmation: "bar" }
    end
    assert_template 'users/new'
    assert_select 'div#error_explanation'
    assert_select 'div.field_with_errors'
  end

  test "valid signup information" do
    get signup_path
    assert_difference 'User.count', 1 do
      post_via_redirect users_path, user: { name:  "Example User",
                                            email: "user@example.com",
                                            password:              "password",
                                            password_confirmation: "password" }
    end
    # assert_template 'users/show'
    # assert is_logged_in?
  end

 
end