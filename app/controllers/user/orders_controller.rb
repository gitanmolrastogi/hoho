require 'digest/sha1'
class User::OrdersController < ApplicationController
 before_action :authenticate_user!
 skip_before_action :verify_authenticity_token  
  def add_to_cart
  	# # p "====ADD TO CART===========#{params.inspect}====================================="
   #  	@object = Activity.find_by_id(params[:id]) if params[:type] == "activity"
   #  	@object = Bus.find_by_id(params[:id]) if params[:type] == "hop"
   #  	@object = MainRoute.find_by_id(params[:id]) if params[:type] == "route"
   #    @order = @object.orders.find_or_create_by(orderable_type: "Activity" , is_paid: false) if params[:type] == "activity"
   #    @order = @object.orders.find_or_create_by(orderable_type: "MainRoute" , is_paid: false) if params[:type] == "route"
   #    @order = @object.orders.find_or_create_by(orderable_type: "Bus" , is_paid: false) if params[:type] == "hop"
   #   if @order
   #   	@order.update(user_id: current_user.id )
   #   	redirect_to my_cart_user_orders_path
   #   	flash[:success] = "Activity successfully added to your cart"  if params[:type] == "activity"
   #    flash[:success] = "Hop successfully added to your cart"  if params[:type] == "hop"
   #    flash[:success] = "Route successfully added to your cart"  if params[:type] == "route"
   #   end

    #my modified code ......
        @object = Activity.find_by_id(params[:id]) if params[:type] == "activity"
        @object = Pass.find_by_id(params[:id]) if params[:type] == "pass"
        @order = @object.orders.find_or_create_by(orderable_type: "Activity" , is_paid: false) if params[:type] == "activity"
        @order = @object.orders.find_or_create_by(orderable_type: "Pass" , is_paid: false) if params[:type] == "pass"
        if @order
          @order.update(user_id: current_user.id )
          redirect_to my_cart_user_orders_path
          flash[:success] = "Activity successfully added to your cart"  if params[:type] == "activity"
          flash[:success] = "Pass successfully added to your cart"  if params[:type] == "pass"
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
    # @responseSuccessURL = "http://delhi-airport.herokuapp.com/user/orders/success"
    # @responseFailURL = "http://delhi-airport.herokuapp.com/user/orders/error"
    # @transactionNotificationURL = "http://delhi-airport.herokuapp.com/user/orders/my_cart"
     @cart_orders = current_user.orders.where("is_paid = ?" ,false)

     @sum =  @cart_orders.where("is_paid = ?" ,false).includes(:orderable).map{|o| o.orderable.price}.compact.sum 
     @responseSuccessURL = "http://localhost:3000/user/orders/success"
     @responseFailURL = "http://localhost:3000/user/orders/error"
     @transactionNotificationURL = "http://localhost:3000/user/orders/my_cart"
     # temporary code, delete it
             # @order = @cart_orders.each do |f|
             #    create_pass_booking(f)
             # end

    # redirect_to success_user_orders_path(order_ids: @cart_orders.pluck(:id) )

  end

  def remove_item
    order = Order.find_by_id(params[:id])
    if order and order.destroy
      redirect_to my_cart_user_orders_path
      return flash[:success] = "Item removed from your cart." 
    else
      redirect_to my_cart_user_orders_path
      flash[:danger] = "Oops!! Something went wrong." 
    end
  end


  def getDateTime
    @date = Time.zone.now.strftime("%Y:%m:%d-%H:%M:%S")
    return @date   
  end

  def success 
    # p "=========================SUCCESS========================="
    p params
    # p "=========================SUCCESS========================="

    @cart_orders = current_user.orders.where("is_paid = ?" ,false)
    

    if @cart_orders.first.id == params[:order_ids].to_i
 
        
        @order = @cart_orders.each do |f|
          f.update(:is_paid=>true , transaction_id: params[:oid] , ipg_transaction_id: params[:ipgTransactionId])
          create_pass_booking(f)
        end
    end

    # @order = Order.where(:id=>params[:order_ids].to_i).each do |f|

    #   f.update(:is_paid=>true , transaction_id: params[:oid] , ipg_transaction_id: params[:ipgTransactionId])
    # end

    # puts "------#{@order.inspect}-------"
    NotifyMailer.user_mailer(current_user,@order,params[:oid],params[:ipgTransactionId]).deliver_now
    redirect_to root_path 
    flash[:success] = "Your transaction has been successfully completed."
  end

  def create_pass_booking(cart_order)
    p "------Cart Orders #{current_user}-------"
    if cart_order.orderable_type == "Pass"
       
        pass = Pass.find_by_id(cart_order.orderable_id)

        PassBooking.create(user_id: current_user.id, category: pass.category, route: pass.route_name,hops_remaining: pass.max_hops,default_pass: false, pass_id: pass.id, valid_upto: Date.today+1.month)

    end      
    
  end


  def error 
    params[:status] == "FAILED"
    redirect_to root_path 
    flash[:success] = params[:fail_reason]
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

