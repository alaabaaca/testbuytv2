require 'test_helper'

class ChuyensControllerTest < ActionController::TestCase
  setup do
    @chuyen = chuyens(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:chuyens)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create chuyen" do
    assert_difference('Chuyen.count') do
      post :create, chuyen: { biensoxe: @chuyen.biensoxe, id: @chuyen.id, mact: @chuyen.mact, matuyen: @chuyen.matuyen, soghe: @chuyen.soghe }
    end

    assert_redirected_to chuyen_path(assigns(:chuyen))
  end

  test "should show chuyen" do
    get :show, id: @chuyen
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @chuyen
    assert_response :success
  end

  test "should update chuyen" do
    put :update, id: @chuyen, chuyen: { biensoxe: @chuyen.biensoxe, id: @chuyen.id, mact: @chuyen.mact, matuyen: @chuyen.matuyen, soghe: @chuyen.soghe }
    assert_redirected_to chuyen_path(assigns(:chuyen))
  end

  test "should destroy chuyen" do
    assert_difference('Chuyen.count', -1) do
      delete :destroy, id: @chuyen
    end

    assert_redirected_to chuyens_path
  end
end
