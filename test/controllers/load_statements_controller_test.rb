require 'test_helper'

class LoadStatementsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @load_statement = load_statements(:one)
  end

  test "should get index" do
    get load_statements_url
    assert_response :success
  end

  test "should get new" do
    get new_load_statement_url
    assert_response :success
  end

  test "should create load_statement" do
    assert_difference('LoadStatement.count') do
      post load_statements_url, params: { load_statement: { insurance: @load_statement.insurance, notes: @load_statement.notes, trailer_rent: @load_statement.trailer_rent, truck_rent: @load_statement.truck_rent } }
    end

    assert_redirected_to load_statement_url(LoadStatement.last)
  end

  test "should show load_statement" do
    get load_statement_url(@load_statement)
    assert_response :success
  end

  test "should get edit" do
    get edit_load_statement_url(@load_statement)
    assert_response :success
  end

  test "should update load_statement" do
    patch load_statement_url(@load_statement), params: { load_statement: { insurance: @load_statement.insurance, notes: @load_statement.notes, trailer_rent: @load_statement.trailer_rent, truck_rent: @load_statement.truck_rent } }
    assert_redirected_to load_statement_url(@load_statement)
  end

  test "should destroy load_statement" do
    assert_difference('LoadStatement.count', -1) do
      delete load_statement_url(@load_statement)
    end

    assert_redirected_to load_statements_url
  end
end
