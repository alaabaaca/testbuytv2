require 'test_helper'

class CokhungthoigiansControllerTest < ActionController::TestCase
  setup do
    @cokhungthoigian = cokhungthoigians(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cokhungthoigians)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cokhungthoigian" do
    assert_difference('Cokhungthoigian.count') do
      post :create, cokhungthoigian: { biensoxe: @cokhungthoigian.biensoxe, id: @cokhungthoigian.id, makhungtg: @cokhungthoigian.makhungtg }
    end

    assert_redirected_to cokhungthoigian_path(assigns(:cokhungthoigian))
  end

  test "should show cokhungthoigian" do
    get :show, id: @cokhungthoigian
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cokhungthoigian
    assert_response :success
  end

  test "should update cokhungthoigian" do
    put :update, id: @cokhungthoigian, cokhungthoigian: { biensoxe: @cokhungthoigian.biensoxe, id: @cokhungthoigian.id, makhungtg: @cokhungthoigian.makhungtg }
    assert_redirected_to cokhungthoigian_path(assigns(:cokhungthoigian))
  end

  test "should destroy cokhungthoigian" do
    assert_difference('Cokhungthoigian.count', -1) do
      delete :destroy, id: @cokhungthoigian
    end

    assert_redirected_to cokhungthoigians_path
  end
end
