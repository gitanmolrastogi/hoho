require 'test_helper'

class User::OrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get add_to_cart" do
    get user_orders_add_to_cart_url
    assert_response :success
  end

  test "should get my_cart" do
    get user_orders_my_cart_url
    assert_response :success
  end

  test "should get my_order_history" do
    get user_orders_my_order_history_url
    assert_response :success
  end

  test "should get remove_item" do
    get user_orders_remove_item_url
    assert_response :success
  end

end
