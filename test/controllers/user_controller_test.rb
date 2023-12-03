require "test_helper"

class UserControllerTest < ActionDispatch::IntegrationTest
  test "should get email:" do
    get user_email:_url
    assert_response :success
  end

  test "should get string" do
    get user_string_url
    assert_response :success
  end
  test "should get first:string" do
    get user_first:string_url
    assert_response :success
  end

  test "should get last:string" do
    get user_last:string_url
    assert_response :success
  end

  test "should get password:string" do
    get user_password:string_url
    assert_response :success
  end

  test "should get courses:string" do
    get user_courses:string_url
    assert_response :success
  end

  test "should get role:" do
    get user_role:_url
    assert_response :success
  end

  test "should get string" do
    get user_string_url
    assert_response :success
  end
end
