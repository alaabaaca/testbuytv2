require 'test_helper'

class CongtiesControllerTest < ActionController::TestCase
  setup do
    @congty = congties(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:congties)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create congty" do
    assert_difference('Congty.count') do
      post :create, congty: { diachict: @congty.diachict, id: @congty.id, mact: @congty.mact, sodtct: @congty.sodtct, tenct: @congty.tenct }
    end

    assert_redirected_to congty_path(assigns(:congty))
  end

  test "should show congty" do
    get :show, id: @congty
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @congty
    assert_response :success
  end

  test "should update congty" do
    put :update, id: @congty, congty: { diachict: @congty.diachict, id: @congty.id, mact: @congty.mact, sodtct: @congty.sodtct, tenct: @congty.tenct }
    assert_redirected_to congty_path(assigns(:congty))
  end

  test "should destroy congty" do
    assert_difference('Congty.count', -1) do
      delete :destroy, id: @congty
    end

    assert_redirected_to congties_path
  end
end
