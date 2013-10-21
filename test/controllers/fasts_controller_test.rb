require 'test_helper'

class FastsControllerTest < ActionController::TestCase
  setup do
    @fast = fasts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fasts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fast" do
    assert_difference('Fast.count') do
      post :create, fast: { notes: @fast.notes, price: @fast.price, seats: @fast.seats, when: @fast.when, where: @fast.where }
    end

    assert_redirected_to fast_path(assigns(:fast))
  end

  test "should show fast" do
    get :show, id: @fast
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fast
    assert_response :success
  end

  test "should update fast" do
    patch :update, id: @fast, fast: { notes: @fast.notes, price: @fast.price, seats: @fast.seats, when: @fast.when, where: @fast.where }
    assert_redirected_to fast_path(assigns(:fast))
  end

  test "should destroy fast" do
    assert_difference('Fast.count', -1) do
      delete :destroy, id: @fast
    end

    assert_redirected_to fasts_path
  end
end
