class OrdersController < ApplicationController
  before_action :require_order, only: :show

  def index
    @orders = current_user.orders
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    puts " 1111111111111111111111111111111111 "
    @total = current_user.cart.total_stripe.to_i
    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })
    puts " 222222222222222222222222222222222222 "
    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @total,
      description: "Payment of #{current_user.first_name} #{current_user.last_name}",
      currency: 'eur',
    })
    puts " 3333333333333333333333333333333333333 "
    
    @cart = current_user.cart
    if !@cart.items.first
      flash.alert = "Votre panier est vide"
      redirect_to cart_path(id: current_user.id)
    else
      puts " 55555555555555555555555555555555555555555555555 "
      @order = Order.new(user_id: current_user.id, status: '1', total_price: @cart.total)
      if @order.save
        @cart_items = @cart.cart_items
        @cart_items.each do |item|
          @order_item = OrderItem.create(order_id: @order.id, item_id: item.item_id, quantity: 1)
          @order_item.save
          item.destroy
        end
        flash.notice = "Votre commande a bien été effectuée"
        redirect_to orders_path
      else
        flash.alert = "Une erreur est survenue #{@order.errors.messages}"
        redirect_to cart_path(id: current_user.id)
      end
    end


  rescue Stripe::CardError => e
    flash[:error] = e.message
    puts e.message
    redirect_to root_path

  end
  def user_order?

    @order = Order.find(params[:id])

    if current_user == @order.user
      return true
    else
      return false
    end
  end

  def require_order
    unless user_order?
      flash[:error] = "You tried the wrong order"
      redirect_to root_path
    end
  end

end
