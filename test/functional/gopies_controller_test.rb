require 'test_helper'

class GopiesControllerTest < ActionController::TestCase
  setup do
    @gopy = gopies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gopies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gopy" do
    assert_difference('Gopy.count') do
      post :create, gopy: { biensoxe: @gopy.biensoxe, id: @gopy.id, noidung: @gopy.noidung }
    end

    assert_redirected_to gopy_path(assigns(:gopy))
  end

  test "should show gopy" do
    get :show, id: @gopy
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gopy
    assert_response :success
  end

  test "should update gopy" do
    put :update, id: @gopy, gopy: { biensoxe: @gopy.biensoxe, id: @gopy.id, noidung: @gopy.noidung }
    assert_redirected_to gopy_path(assigns(:gopy))
  end

  test "should destroy gopy" do
    assert_difference('Gopy.count', -1) do
      delete :destroy, id: @gopy
    end

    assert_redirected_to gopies_path
  end
end
