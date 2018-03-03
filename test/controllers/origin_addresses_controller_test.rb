require 'test_helper'

class OriginAddressesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @origin_address = origin_addresses(:one)
  end

  test "should get index" do
    get origin_addresses_url
    assert_response :success
  end

  test "should get new" do
    get new_origin_address_url
    assert_response :success
  end

  test "should create origin_address" do
    assert_difference('OriginAddress.count') do
      post origin_addresses_url, params: { origin_address: { city: @origin_address.city, latitude: @origin_address.latitude, load_id: @origin_address.load_id, longitude: @origin_address.longitude, notes: @origin_address.notes, state: @origin_address.state, street2: @origin_address.street2, street: @origin_address.street, type: @origin_address.type, zip: @origin_address.zip } }
    end

    assert_redirected_to origin_address_url(OriginAddress.last)
  end

  test "should show origin_address" do
    get origin_address_url(@origin_address)
    assert_response :success
  end

  test "should get edit" do
    get edit_origin_address_url(@origin_address)
    assert_response :success
  end

  test "should update origin_address" do
    patch origin_address_url(@origin_address), params: { origin_address: { city: @origin_address.city, latitude: @origin_address.latitude, load_id: @origin_address.load_id, longitude: @origin_address.longitude, notes: @origin_address.notes, state: @origin_address.state, street2: @origin_address.street2, street: @origin_address.street, type: @origin_address.type, zip: @origin_address.zip } }
    assert_redirected_to origin_address_url(@origin_address)
  end

  test "should destroy origin_address" do
    assert_difference('OriginAddress.count', -1) do
      delete origin_address_url(@origin_address)
    end

    assert_redirected_to origin_addresses_url
  end
end
