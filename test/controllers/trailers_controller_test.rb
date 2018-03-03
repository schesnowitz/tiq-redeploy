require 'test_helper'

class TrailersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @trailer = trailers(:one)
  end

  test "should get index" do
    get trailers_url
    assert_response :success
  end

  test "should get new" do
    get new_trailer_url
    assert_response :success
  end

  test "should create trailer" do
    assert_difference('Trailer.count') do
      post trailers_url, params: { trailer: { color: @trailer.color, driver_user_id: @trailer.driver_user_id, image: @trailer.image, make: @trailer.make, model: @trailer.model, notes: @trailer.notes, number: @trailer.number, service_status: @trailer.service_status, vin: @trailer.vin, year: @trailer.year } }
    end

    assert_redirected_to trailer_url(Trailer.last)
  end

  test "should show trailer" do
    get trailer_url(@trailer)
    assert_response :success
  end

  test "should get edit" do
    get edit_trailer_url(@trailer)
    assert_response :success
  end

  test "should update trailer" do
    patch trailer_url(@trailer), params: { trailer: { color: @trailer.color, driver_user_id: @trailer.driver_user_id, image: @trailer.image, make: @trailer.make, model: @trailer.model, notes: @trailer.notes, number: @trailer.number, service_status: @trailer.service_status, vin: @trailer.vin, year: @trailer.year } }
    assert_redirected_to trailer_url(@trailer)
  end

  test "should destroy trailer" do
    assert_difference('Trailer.count', -1) do
      delete trailer_url(@trailer)
    end

    assert_redirected_to trailers_url
  end
end
