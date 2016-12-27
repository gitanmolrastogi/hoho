require 'digest/sha1'
class User::OrdersController < ApplicationController
 before_action :authenticate_user!
 skip_before_action :verify_authenticity_token  
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

  def order_payment
    @responseSuccessURL = "http://172.16.1.68:3000/user/orders/success"
    @responseFailURL = "http://172.16.1.68:3000/user/orders/error"
    @transactionNotificationURL = "http://172.16.1.68:3000/user/orders/my_cart"
    @cart_orders = current_user.orders.where("is_paid = ?" ,false)
    @sum =  @cart_orders.where("is_paid = ?" ,false).includes(:orderable).map{|o| o.orderable.price}.compact.sum 
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

  def getDateTime
    @date = Time.now.strftime("%Y:%m:%d-%H:%M:%S")
    return @date   
  end

  def success 
    @order = Order.where(:id=>params[:order_ids].scan( /\d+/ )).each do |f|
      f.update(:is_paid=>true , transaction_id: params[:oid] , ipg_transaction_id: params[:ipgTransactionId])
    end
     NotifyMailer.user_mailer(current_user,@order,params[:oid],params[:ipgTransactionId]).deliver_now
    redirect_to root_path , :notice => "Your Transaction has been successfully completed."   
  end

  def error 
    params[:status] == "FAILED"
    redirect_to root_path , :notice => "#{params[:fail_reason]}"   
  end
  
  helper_method :getDateTime

  def createHash(chargetotal, currency)
    @storeId = "3344000171"
    @sharedSecret = "asdf1234"
    @stringToHash = @storeId + getDateTime + chargetotal.to_s + currency.to_s + @sharedSecret
    @hash = @stringToHash.unpack('H*').first
    @lasthast = Digest::SHA1.hexdigest @hash
    return @lasthast
  end
  helper_method :createHash
end
