require 'test_helper'

class Request2sControllerTest < ActionController::TestCase
  setup do
    @request2 = request2s(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:request2s)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create request2" do
    assert_difference('Request2.count') do
      post :create, request2: { : @request2., accept: @request2.accept, fast_id: @request2.fast_id, fast_user_email,: @request2.fast_user_email,, phone: @request2.phone, user_email: @request2.user_email, user_id: @request2.user_id }
    end

    assert_redirected_to request2_path(assigns(:request2))
  end

  test "should show request2" do
    get :show, id: @request2
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @request2
    assert_response :success
  end

  test "should update request2" do
    patch :update, id: @request2, request2: { : @request2., accept: @request2.accept, fast_id: @request2.fast_id, fast_user_email,: @request2.fast_user_email,, phone: @request2.phone, user_email: @request2.user_email, user_id: @request2.user_id }
    assert_redirected_to request2_path(assigns(:request2))
  end

  test "should destroy request2" do
    assert_difference('Request2.count', -1) do
      delete :destroy, id: @request2
    end

    assert_redirected_to request2s_path
  end
end
