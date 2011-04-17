require 'test_helper'

class InvestorSessionsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:investor_sessions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create investor_session" do
    assert_difference('InvestorSession.count') do
      post :create, :investor_session => { }
    end

    assert_redirected_to investor_session_path(assigns(:investor_session))
  end

  test "should show investor_session" do
    get :show, :id => investor_sessions(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => investor_sessions(:one).to_param
    assert_response :success
  end

  test "should update investor_session" do
    put :update, :id => investor_sessions(:one).to_param, :investor_session => { }
    assert_redirected_to investor_session_path(assigns(:investor_session))
  end

  test "should destroy investor_session" do
    assert_difference('InvestorSession.count', -1) do
      delete :destroy, :id => investor_sessions(:one).to_param
    end

    assert_redirected_to investor_sessions_path
  end
end
