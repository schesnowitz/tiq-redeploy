require 'test_helper'

class CompanyProfileMembershipsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @company_profile_membership = company_profile_memberships(:one)
  end

  test "should get index" do
    get company_profile_memberships_url
    assert_response :success
  end

  test "should get new" do
    get new_company_profile_membership_url
    assert_response :success
  end

  test "should create company_profile_membership" do
    assert_difference('CompanyProfileMembership.count') do
      post company_profile_memberships_url, params: { company_profile_membership: { company_profile_id: @company_profile_membership.company_profile_id, membership_type: @company_profile_membership.membership_type, user_id: @company_profile_membership.user_id } }
    end

    assert_redirected_to company_profile_membership_url(CompanyProfileMembership.last)
  end

  test "should show company_profile_membership" do
    get company_profile_membership_url(@company_profile_membership)
    assert_response :success
  end

  test "should get edit" do
    get edit_company_profile_membership_url(@company_profile_membership)
    assert_response :success
  end

  test "should update company_profile_membership" do
    patch company_profile_membership_url(@company_profile_membership), params: { company_profile_membership: { company_profile_id: @company_profile_membership.company_profile_id, membership_type: @company_profile_membership.membership_type, user_id: @company_profile_membership.user_id } }
    assert_redirected_to company_profile_membership_url(@company_profile_membership)
  end

  test "should destroy company_profile_membership" do
    assert_difference('CompanyProfileMembership.count', -1) do
      delete company_profile_membership_url(@company_profile_membership)
    end

    assert_redirected_to company_profile_memberships_url
  end
end
