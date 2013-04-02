require 'test_helper'

class DiemtrentuyensControllerTest < ActionController::TestCase
  setup do
    @diemtrentuyen = diemtrentuyens(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:diemtrentuyens)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create diemtrentuyen" do
    assert_difference('Diemtrentuyen.count') do
      post :create, diemtrentuyen: { id: @diemtrentuyen.id, kinhdo: @diemtrentuyen.kinhdo, matuyen: @diemtrentuyen.matuyen, vido: @diemtrentuyen.vido }
    end

    assert_redirected_to diemtrentuyen_path(assigns(:diemtrentuyen))
  end

  test "should show diemtrentuyen" do
    get :show, id: @diemtrentuyen
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @diemtrentuyen
    assert_response :success
  end

  test "should update diemtrentuyen" do
    put :update, id: @diemtrentuyen, diemtrentuyen: { id: @diemtrentuyen.id, kinhdo: @diemtrentuyen.kinhdo, matuyen: @diemtrentuyen.matuyen, vido: @diemtrentuyen.vido }
    assert_redirected_to diemtrentuyen_path(assigns(:diemtrentuyen))
  end

  test "should destroy diemtrentuyen" do
    assert_difference('Diemtrentuyen.count', -1) do
      delete :destroy, id: @diemtrentuyen
    end

    assert_redirected_to diemtrentuyens_path
  end
end
