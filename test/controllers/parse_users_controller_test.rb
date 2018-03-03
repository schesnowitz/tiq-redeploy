require 'test_helper'

class ParseUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @parse_user = parse_users(:one)
  end

  test "should get index" do
    get parse_users_url
    assert_response :success
  end

  test "should get new" do
    get new_parse_user_url
    assert_response :success
  end

  test "should create parse_user" do
    assert_difference('ParseUser.count') do
      post parse_users_url, params: { parse_user: { email: @parse_user.email, password: @parse_user.password, username: @parse_user.username } }
    end

    assert_redirected_to parse_user_url(ParseUser.last)
  end

  test "should show parse_user" do
    get parse_user_url(@parse_user)
    assert_response :success
  end

  test "should get edit" do
    get edit_parse_user_url(@parse_user)
    assert_response :success
  end

  test "should update parse_user" do
    patch parse_user_url(@parse_user), params: { parse_user: { email: @parse_user.email, password: @parse_user.password, username: @parse_user.username } }
    assert_redirected_to parse_user_url(@parse_user)
  end

  test "should destroy parse_user" do
    assert_difference('ParseUser.count', -1) do
      delete parse_user_url(@parse_user)
    end

    assert_redirected_to parse_users_url
  end
end
