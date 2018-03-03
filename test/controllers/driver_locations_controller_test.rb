require 'test_helper'

class DriverLocationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @driver_location = driver_locations(:one)
  end

  test "should get index" do
    get driver_locations_url
    assert_response :success
  end

  test "should get new" do
    get new_driver_location_url
    assert_response :success
  end

  test "should create driver_location" do
    assert_difference('DriverLocation.count') do
      post driver_locations_url, params: { driver_location: { bearing: @driver_location.bearing, driver_email: @driver_location.driver_email, driver_user_id: @driver_location.driver_user_id, latitude: @driver_location.latitude, longitude: @driver_location.longitude, parse_created_at: @driver_location.parse_created_at, parse_id: @driver_location.parse_id, parse_updated_at: @driver_location.parse_updated_at, speed: @driver_location.speed } }
    end

    assert_redirected_to driver_location_url(DriverLocation.last)
  end

  test "should show driver_location" do
    get driver_location_url(@driver_location)
    assert_response :success
  end

  test "should get edit" do
    get edit_driver_location_url(@driver_location)
    assert_response :success
  end

  test "should update driver_location" do
    patch driver_location_url(@driver_location), params: { driver_location: { bearing: @driver_location.bearing, driver_email: @driver_location.driver_email, driver_user_id: @driver_location.driver_user_id, latitude: @driver_location.latitude, longitude: @driver_location.longitude, parse_created_at: @driver_location.parse_created_at, parse_id: @driver_location.parse_id, parse_updated_at: @driver_location.parse_updated_at, speed: @driver_location.speed } }
    assert_redirected_to driver_location_url(@driver_location)
  end

  test "should destroy driver_location" do
    assert_difference('DriverLocation.count', -1) do
      delete driver_location_url(@driver_location)
    end

    assert_redirected_to driver_locations_url
  end
end
