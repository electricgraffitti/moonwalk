require 'test_helper'

class InvestorsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:investors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create investor" do
    assert_difference('Investor.count') do
      post :create, :investor => { }
    end

    assert_redirected_to investor_path(assigns(:investor))
  end

  test "should show investor" do
    get :show, :id => investors(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => investors(:one).to_param
    assert_response :success
  end

  test "should update investor" do
    put :update, :id => investors(:one).to_param, :investor => { }
    assert_redirected_to investor_path(assigns(:investor))
  end

  test "should destroy investor" do
    assert_difference('Investor.count', -1) do
      delete :destroy, :id => investors(:one).to_param
    end

    assert_redirected_to investors_path
  end
end
