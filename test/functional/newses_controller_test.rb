require 'test_helper'

class NewsesControllerTest < ActionController::TestCase
  setup do
    @newse = newses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:newses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create newse" do
    assert_difference('Newse.count') do
      post :create, newse: {  }
    end

    assert_redirected_to newse_path(assigns(:newse))
  end

  test "should show newse" do
    get :show, id: @newse
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @newse
    assert_response :success
  end

  test "should update newse" do
    put :update, id: @newse, newse: {  }
    assert_redirected_to newse_path(assigns(:newse))
  end

  test "should destroy newse" do
    assert_difference('Newse.count', -1) do
      delete :destroy, id: @newse
    end

    assert_redirected_to newses_path
  end
end
