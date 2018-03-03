require 'test_helper'

class AppVariablesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @app_variable = app_variables(:one)
  end

  test "should get index" do
    get app_variables_url
    assert_response :success
  end

  test "should get new" do
    get new_app_variable_url
    assert_response :success
  end

  test "should create app_variable" do
    assert_difference('AppVariable.count') do
      post app_variables_url, params: { app_variable: { app_agree_terms: @app_variable.app_agree_terms, app_conditions: @app_variable.app_conditions, app_favi: @app_variable.app_favi, app_logo: @app_variable.app_logo, app_logo_name: @app_variable.app_logo_name, app_name: @app_variable.app_name, app_slogan: @app_variable.app_slogan, app_tab_name: @app_variable.app_tab_name, app_terms: @app_variable.app_terms } }
    end

    assert_redirected_to app_variable_url(AppVariable.last)
  end

  test "should show app_variable" do
    get app_variable_url(@app_variable)
    assert_response :success
  end

  test "should get edit" do
    get edit_app_variable_url(@app_variable)
    assert_response :success
  end

  test "should update app_variable" do
    patch app_variable_url(@app_variable), params: { app_variable: { app_agree_terms: @app_variable.app_agree_terms, app_conditions: @app_variable.app_conditions, app_favi: @app_variable.app_favi, app_logo: @app_variable.app_logo, app_logo_name: @app_variable.app_logo_name, app_name: @app_variable.app_name, app_slogan: @app_variable.app_slogan, app_tab_name: @app_variable.app_tab_name, app_terms: @app_variable.app_terms } }
    assert_redirected_to app_variable_url(@app_variable)
  end

  test "should destroy app_variable" do
    assert_difference('AppVariable.count', -1) do
      delete app_variable_url(@app_variable)
    end

    assert_redirected_to app_variables_url
  end
end
