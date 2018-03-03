require 'test_helper'

class LoadAddressesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @load_address = load_addresses(:one)
  end

  test "should get index" do
    get load_addresses_url
    assert_response :success
  end

  test "should get new" do
    get new_load_address_url
    assert_response :success
  end

  test "should create load_address" do
    assert_difference('LoadAddress.count') do
      post load_addresses_url, params: { load_address: { address_type: @load_address.address_type, city: @load_address.city, company: @load_address.company, contact: @load_address.contact, latitude: @load_address.latitude, load_id: @load_address.load_id, longitude: @load_address.longitude, phone: @load_address.phone, state: @load_address.state, street2: @load_address.street2, street: @load_address.street, zip: @load_address.zip } }
    end

    assert_redirected_to load_address_url(LoadAddress.last)
  end

  test "should show load_address" do
    get load_address_url(@load_address)
    assert_response :success
  end

  test "should get edit" do
    get edit_load_address_url(@load_address)
    assert_response :success
  end

  test "should update load_address" do
    patch load_address_url(@load_address), params: { load_address: { address_type: @load_address.address_type, city: @load_address.city, company: @load_address.company, contact: @load_address.contact, latitude: @load_address.latitude, load_id: @load_address.load_id, longitude: @load_address.longitude, phone: @load_address.phone, state: @load_address.state, street2: @load_address.street2, street: @load_address.street, zip: @load_address.zip } }
    assert_redirected_to load_address_url(@load_address)
  end

  test "should destroy load_address" do
    assert_difference('LoadAddress.count', -1) do
      delete load_address_url(@load_address)
    end

    assert_redirected_to load_addresses_url
  end
end
