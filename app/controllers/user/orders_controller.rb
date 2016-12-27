class User::OrdersController < ApplicationController
 before_action :authenticate_user!
  def add_to_cart
  	p "====ADD TO CART===========#{params.inspect}====================================="
    	@object = Activity.find_by_id(params[:id]) if params[:type] == "activity"
    	@object = Bus.find_by_id(params[:id]) if params[:type] == "hop"
    	@object = MainRoute.find_by_id(params[:id]) if params[:type] == "route"
      @order = @object.orders.find_or_create_by(orderable_type: "Activity" , is_paid: false) if params[:type] == "activity"
      @order = @object.orders.find_or_create_by(orderable_type: "MainRoute" , is_paid: false) if params[:type] == "route"
      @order = @object.orders.find_or_create_by(orderable_type: "Bus" , is_paid: false) if params[:type] == "hop"
     if @order
     	@order.update(user_id: current_user.id )
     	redirect_to my_cart_user_orders_path
     	flash[:notice] = "Activity successfully added to your cart"  if params[:type] == "activity"
      flash[:notice] = "Hop successfully added to your cart"  if params[:type] == "hop"
      flash[:notice] = "Route successfully added to your cart"  if params[:type] == "route"
     end
  end

  def my_cart
  	@cart_orders = current_user.orders.where("is_paid = ?" ,false)
    @sum =  @cart_orders.where("is_paid = ?" ,false).includes(:orderable).map{|o| o.orderable.price}.compact.sum 
  end

  def my_order_history
    @cart_orders = current_user.orders.where("is_paid = ?" ,true)

  end

  def remove_item
    order = Order.find_by_id(params[:id])
    if order and order.destroy
      redirect_to my_cart_user_orders_path
      return flash[:notice] = "Item removed from your cart." 
    else
      redirect_to my_cart_user_orders_path
      flash[:notice] = "Oops!! Something went wrong." 
    end
  end
end