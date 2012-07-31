require 'test_helper'

class CategoysControllerTest < ActionController::TestCase
  setup do
    @categoy = categoys(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:categoys)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create categoy" do
    assert_difference('Categoy.count') do
      post :create, categoy: @categoy.attributes
    end

    assert_redirected_to categoy_path(assigns(:categoy))
  end

  test "should show categoy" do
    get :show, id: @categoy.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @categoy.to_param
    assert_response :success
  end

  test "should update categoy" do
    put :update, id: @categoy.to_param, categoy: @categoy.attributes
    assert_redirected_to categoy_path(assigns(:categoy))
  end

  test "should destroy categoy" do
    assert_difference('Categoy.count', -1) do
      delete :destroy, id: @categoy.to_param
    end

    assert_redirected_to categoys_path
  end
end
