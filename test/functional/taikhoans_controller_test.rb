require 'test_helper'

class TaikhoansControllerTest < ActionController::TestCase
  setup do
    @taikhoan = taikhoans(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:taikhoans)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create taikhoan" do
    assert_difference('Taikhoan.count') do
      post :create, taikhoan: { id: @taikhoan.id, mact: @taikhoan.mact, matkhau: @taikhoan.matkhau, tentk: @taikhoan.tentk }
    end

    assert_redirected_to taikhoan_path(assigns(:taikhoan))
  end

  test "should show taikhoan" do
    get :show, id: @taikhoan
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @taikhoan
    assert_response :success
  end

  test "should update taikhoan" do
    put :update, id: @taikhoan, taikhoan: { id: @taikhoan.id, mact: @taikhoan.mact, matkhau: @taikhoan.matkhau, tentk: @taikhoan.tentk }
    assert_redirected_to taikhoan_path(assigns(:taikhoan))
  end

  test "should destroy taikhoan" do
    assert_difference('Taikhoan.count', -1) do
      delete :destroy, id: @taikhoan
    end

    assert_redirected_to taikhoans_path
  end
end
