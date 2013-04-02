require 'test_helper'

class TramdungsControllerTest < ActionController::TestCase
  setup do
    @tramdung = tramdungs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tramdungs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tramdung" do
    assert_difference('Tramdung.count') do
      post :create, tramdung: { diachitram: @tramdung.diachitram, id: @tramdung.id, matram: @tramdung.matram, tentram: @tramdung.tentram }
    end

    assert_redirected_to tramdung_path(assigns(:tramdung))
  end

  test "should show tramdung" do
    get :show, id: @tramdung
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tramdung
    assert_response :success
  end

  test "should update tramdung" do
    put :update, id: @tramdung, tramdung: { diachitram: @tramdung.diachitram, id: @tramdung.id, matram: @tramdung.matram, tentram: @tramdung.tentram }
    assert_redirected_to tramdung_path(assigns(:tramdung))
  end

  test "should destroy tramdung" do
    assert_difference('Tramdung.count', -1) do
      delete :destroy, id: @tramdung
    end

    assert_redirected_to tramdungs_path
  end
end
