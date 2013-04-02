require 'test_helper'

class KhungthoigiansControllerTest < ActionController::TestCase
  setup do
    @khungthoigian = khungthoigians(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:khungthoigians)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create khungthoigian" do
    assert_difference('Khungthoigian.count') do
      post :create, khungthoigian: { den: @khungthoigian.den, di: @khungthoigian.di, id: @khungthoigian.id }
    end

    assert_redirected_to khungthoigian_path(assigns(:khungthoigian))
  end

  test "should show khungthoigian" do
    get :show, id: @khungthoigian
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @khungthoigian
    assert_response :success
  end

  test "should update khungthoigian" do
    put :update, id: @khungthoigian, khungthoigian: { den: @khungthoigian.den, di: @khungthoigian.di, id: @khungthoigian.id }
    assert_redirected_to khungthoigian_path(assigns(:khungthoigian))
  end

  test "should destroy khungthoigian" do
    assert_difference('Khungthoigian.count', -1) do
      delete :destroy, id: @khungthoigian
    end

    assert_redirected_to khungthoigians_path
  end
end
