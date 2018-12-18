require 'test_helper'

class OrderInsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order_in = order_ins(:one)
  end

  test "should get index" do
    get order_ins_url
    assert_response :success
  end

  test "should get new" do
    get new_order_in_url
    assert_response :success
  end

  test "should create order_in" do
    assert_difference('OrderIn.count') do
      post order_ins_url, params: { order_in: { company: @order_in.company, expected_out_date: @order_in.expected_out_date, order_date: @order_in.order_date, product_id: @order_in.product_id, product_quantity: @order_in.product_quantity, purchase_price: @order_in.purchase_price, sale_price: @order_in.sale_price, source_id: @order_in.source_id } }
    end

    assert_redirected_to order_in_url(OrderIn.last)
  end

  test "should show order_in" do
    get order_in_url(@order_in)
    assert_response :success
  end

  test "should get edit" do
    get edit_order_in_url(@order_in)
    assert_response :success
  end

  test "should update order_in" do
    patch order_in_url(@order_in), params: { order_in: { company: @order_in.company, expected_out_date: @order_in.expected_out_date, order_date: @order_in.order_date, product_id: @order_in.product_id, product_quantity: @order_in.product_quantity, purchase_price: @order_in.purchase_price, sale_price: @order_in.sale_price, source_id: @order_in.source_id } }
    assert_redirected_to order_in_url(@order_in)
  end

  test "should destroy order_in" do
    assert_difference('OrderIn.count', -1) do
      delete order_in_url(@order_in)
    end

    assert_redirected_to order_ins_url
  end
end
