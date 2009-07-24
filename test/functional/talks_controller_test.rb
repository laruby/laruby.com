require 'test_helper'

class TalksControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:talks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create talk" do
    assert_difference('Talk.count') do
      post :create, :talk => { }
    end

    assert_redirected_to talk_path(assigns(:talk))
  end

  test "should show talk" do
    get :show, :id => talks(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => talks(:one).to_param
    assert_response :success
  end

  test "should update talk" do
    put :update, :id => talks(:one).to_param, :talk => { }
    assert_redirected_to talk_path(assigns(:talk))
  end

  test "should destroy talk" do
    assert_difference('Talk.count', -1) do
      delete :destroy, :id => talks(:one).to_param
    end

    assert_redirected_to talks_path
  end
end
