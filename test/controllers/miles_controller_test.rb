require 'test_helper'

class MilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mile = miles(:one)
  end

  test "should get index" do
    get miles_url
    assert_response :success
  end

  test "should get new" do
    get new_mile_url
    assert_response :success
  end

  test "should create mile" do
    assert_difference('Mile.count') do
      post miles_url, params: { mile: { mileage: @mile.mileage, notes: @mile.notes, type: @mile.type } }
    end

    assert_redirected_to mile_url(Mile.last)
  end

  test "should show mile" do
    get mile_url(@mile)
    assert_response :success
  end

  test "should get edit" do
    get edit_mile_url(@mile)
    assert_response :success
  end

  test "should update mile" do
    patch mile_url(@mile), params: { mile: { mileage: @mile.mileage, notes: @mile.notes, type: @mile.type } }
    assert_redirected_to mile_url(@mile)
  end

  test "should destroy mile" do
    assert_difference('Mile.count', -1) do
      delete mile_url(@mile)
    end

    assert_redirected_to miles_url
  end
end
