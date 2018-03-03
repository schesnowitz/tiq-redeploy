require 'test_helper'

class LoadExpensesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @load_expense = load_expenses(:one)
  end

  test "should get index" do
    get load_expenses_url
    assert_response :success
  end

  test "should get new" do
    get new_load_expense_url
    assert_response :success
  end

  test "should create load_expense" do
    assert_difference('LoadExpense.count') do
      post load_expenses_url, params: { load_expense: { amount: @load_expense.amount, business_name: @load_expense.business_name, city: @load_expense.city, latitude: @load_expense.latitude, load_id: @load_expense.load_id, longitude: @load_expense.longitude, state: @load_expense.state, street: @load_expense.street, type: @load_expense.type, zip: @load_expense.zip } }
    end

    assert_redirected_to load_expense_url(LoadExpense.last)
  end

  test "should show load_expense" do
    get load_expense_url(@load_expense)
    assert_response :success
  end

  test "should get edit" do
    get edit_load_expense_url(@load_expense)
    assert_response :success
  end

  test "should update load_expense" do
    patch load_expense_url(@load_expense), params: { load_expense: { amount: @load_expense.amount, business_name: @load_expense.business_name, city: @load_expense.city, latitude: @load_expense.latitude, load_id: @load_expense.load_id, longitude: @load_expense.longitude, state: @load_expense.state, street: @load_expense.street, type: @load_expense.type, zip: @load_expense.zip } }
    assert_redirected_to load_expense_url(@load_expense)
  end

  test "should destroy load_expense" do
    assert_difference('LoadExpense.count', -1) do
      delete load_expense_url(@load_expense)
    end

    assert_redirected_to load_expenses_url
  end
end
