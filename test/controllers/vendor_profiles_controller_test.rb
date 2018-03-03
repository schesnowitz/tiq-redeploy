require 'test_helper'

class VendorProfilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vendor_profile = vendor_profiles(:one)
  end

  test "should get index" do
    get vendor_profiles_url
    assert_response :success
  end

  test "should get new" do
    get new_vendor_profile_url
    assert_response :success
  end

  test "should create vendor_profile" do
    assert_difference('VendorProfile.count') do
      post vendor_profiles_url, params: { vendor_profile: { city: @vendor_profile.city, company_name: @vendor_profile.company_name, contact_name: @vendor_profile.contact_name, email: @vendor_profile.email, fax: @vendor_profile.fax, logo: @vendor_profile.logo, state: @vendor_profile.state, street: @vendor_profile.street, telephone: @vendor_profile.telephone, website: @vendor_profile.website, zip: @vendor_profile.zip } }
    end

    assert_redirected_to vendor_profile_url(VendorProfile.last)
  end

  test "should show vendor_profile" do
    get vendor_profile_url(@vendor_profile)
    assert_response :success
  end

  test "should get edit" do
    get edit_vendor_profile_url(@vendor_profile)
    assert_response :success
  end

  test "should update vendor_profile" do
    patch vendor_profile_url(@vendor_profile), params: { vendor_profile: { city: @vendor_profile.city, company_name: @vendor_profile.company_name, contact_name: @vendor_profile.contact_name, email: @vendor_profile.email, fax: @vendor_profile.fax, logo: @vendor_profile.logo, state: @vendor_profile.state, street: @vendor_profile.street, telephone: @vendor_profile.telephone, website: @vendor_profile.website, zip: @vendor_profile.zip } }
    assert_redirected_to vendor_profile_url(@vendor_profile)
  end

  test "should destroy vendor_profile" do
    assert_difference('VendorProfile.count', -1) do
      delete vendor_profile_url(@vendor_profile)
    end

    assert_redirected_to vendor_profiles_url
  end
end
