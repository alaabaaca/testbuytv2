require 'test_helper'

class DiquatramsControllerTest < ActionController::TestCase
  setup do
    @diquatram = diquatrams(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:diquatrams)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create diquatram" do
    assert_difference('Diquatram.count') do
      post :create, diquatram: { id: @diquatram.id, matram: @diquatram.matram, matuyen: @diquatram.matuyen }
    end

    assert_redirected_to diquatram_path(assigns(:diquatram))
  end

  test "should show diquatram" do
    get :show, id: @diquatram
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @diquatram
    assert_response :success
  end

  test "should update diquatram" do
    put :update, id: @diquatram, diquatram: { id: @diquatram.id, matram: @diquatram.matram, matuyen: @diquatram.matuyen }
    assert_redirected_to diquatram_path(assigns(:diquatram))
  end

  test "should destroy diquatram" do
    assert_difference('Diquatram.count', -1) do
      delete :destroy, id: @diquatram
    end

    assert_redirected_to diquatrams_path
  end
end
