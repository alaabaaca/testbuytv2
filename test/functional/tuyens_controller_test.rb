require 'test_helper'

class TuyensControllerTest < ActionController::TestCase
  setup do
    @tuyen = tuyens(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tuyens)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tuyen" do
    assert_difference('Tuyen.count') do
      post :create, tuyen: { culy: @tuyen.culy, giancach: @tuyen.giancach, id: @tuyen.id, loaihinh: @tuyen.loaihinh, matuyen: @tuyen.matuyen, sochuyen: @tuyen.sochuyen, tentuyen: @tuyen.tentuyen, tghoatdong: @tuyen.tghoatdong, thoigianchuyen: @tuyen.thoigianchuyen }
    end

    assert_redirected_to tuyen_path(assigns(:tuyen))
  end

  test "should show tuyen" do
    get :show, id: @tuyen
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tuyen
    assert_response :success
  end

  test "should update tuyen" do
    put :update, id: @tuyen, tuyen: { culy: @tuyen.culy, giancach: @tuyen.giancach, id: @tuyen.id, loaihinh: @tuyen.loaihinh, matuyen: @tuyen.matuyen, sochuyen: @tuyen.sochuyen, tentuyen: @tuyen.tentuyen, tghoatdong: @tuyen.tghoatdong, thoigianchuyen: @tuyen.thoigianchuyen }
    assert_redirected_to tuyen_path(assigns(:tuyen))
  end

  test "should destroy tuyen" do
    assert_difference('Tuyen.count', -1) do
      delete :destroy, id: @tuyen
    end

    assert_redirected_to tuyens_path
  end
end
