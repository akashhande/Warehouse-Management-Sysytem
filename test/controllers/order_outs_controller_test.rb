require 'test_helper'

class OrderOutsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order_out = order_outs(:one)
  end

  test "should get index" do
    get order_outs_url
    assert_response :success
  end

  test "should get new" do
    get new_order_out_url
    assert_response :success
  end

  test "should create order_out" do
    assert_difference('OrderOut.count') do
      post order_outs_url, params: { order_out: { company: @order_out.company, customer_name: @order_out.customer_name, delivery_address: @order_out.delivery_address, delivery_address_city: @order_out.delivery_address_city, delivery_address_country: @order_out.delivery_address_country, delivery_address_zip: @order_out.delivery_address_zip, order_date: @order_out.order_date, orderer_name: @order_out.orderer_name, product_id: @order_out.product_id, product_quantity: @order_out.product_quantity, source_id: @order_out.source_id } }
    end

    assert_redirected_to order_out_url(OrderOut.last)
  end

  test "should show order_out" do
    get order_out_url(@order_out)
    assert_response :success
  end

  test "should get edit" do
    get edit_order_out_url(@order_out)
    assert_response :success
  end

  test "should update order_out" do
    patch order_out_url(@order_out), params: { order_out: { company: @order_out.company, customer_name: @order_out.customer_name, delivery_address: @order_out.delivery_address, delivery_address_city: @order_out.delivery_address_city, delivery_address_country: @order_out.delivery_address_country, delivery_address_zip: @order_out.delivery_address_zip, order_date: @order_out.order_date, orderer_name: @order_out.orderer_name, product_id: @order_out.product_id, product_quantity: @order_out.product_quantity, source_id: @order_out.source_id } }
    assert_redirected_to order_out_url(@order_out)
  end

  test "should destroy order_out" do
    assert_difference('OrderOut.count', -1) do
      delete order_out_url(@order_out)
    end

    assert_redirected_to order_outs_url
  end
end
