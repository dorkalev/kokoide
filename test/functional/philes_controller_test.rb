require 'test_helper'

class PhilesControllerTest < ActionController::TestCase
  setup do
    @phile = philes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:philes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create phile" do
    assert_difference('Phile.count') do
      post :create, phile: @phile.attributes
    end

    assert_redirected_to phile_path(assigns(:phile))
  end

  test "should show phile" do
    get :show, id: @phile
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @phile
    assert_response :success
  end

  test "should update phile" do
    put :update, id: @phile, phile: @phile.attributes
    assert_redirected_to phile_path(assigns(:phile))
  end

  test "should destroy phile" do
    assert_difference('Phile.count', -1) do
      delete :destroy, id: @phile
    end

    assert_redirected_to philes_path
  end
end
