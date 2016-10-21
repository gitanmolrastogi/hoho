class User::OrdersController < ApplicationController
 before_action :authenticate_user!
  def add_to_cart
  	p "====ADD TO CART===========#{params.inspect}====================================="
    	@object = Activity.find_by_id(params[:id]) if params[:type] == "activity"
    	@object = Bus.find_by_id(params[:id]) if params[:type] == "hop"
    	@object = MainRoute.find_by_id(params[:id]) if params[:type] == "route"
      @order = @object.orders.new
     if @order.save
     	@order.update(user_id: current_user.id , is_paid: false)
     	redirect_to my_cart_user_orders_path
     	flash[:notice] = "Activity sucessfully added to your cart"  if params[:type] == "activity"
      flash[:notice] = "Hop sucessfully added to your cart"  if params[:type] == "hop"
      flash[:notice] = "Route sucessfully added to your cart"  if params[:type] == "route"
     end
  end

  def my_cart
  	@cart_orders = current_user.orders.where("is_paid = ?" ,false)
    @sum =  @cart_orders.where("is_paid = ?" ,false).includes(:orderable).map{|o| o.orderable.price}.sum 
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
