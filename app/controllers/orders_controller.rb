class OrdersController < ApplicationController
  before_action :require_order, only: :show
  
  def index
    @orders = current_user.orders
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    @cart = current_user.cart
    if !@cart.items.first
      flash.alert = "Votre panier est vide"
      redirect_to cart_path(id: current_user.id)
    else
      @order = Order.new(user_id: current_user.id, status: '1', total_price: @cart.total)
      if @order.save
        @cart_items = @cart.cart_items
        @cart_items.each do |item|
          @order_item = OrderItem.create(order_id: @order.id, item_id: item.item_id, quantity: 1)
          @order_item.save
          item.destroy
        end
        flash.notice = "Votre commande a bien été effectuée"
        redirect_to root_path
      else
        flash.alert = "Une erreur est survenue #{@order.errors.messages}"
        redirect_to cart_path(id: current_user.id)
      end
    end
  end

  def user_order?

    @order = Order.find(params[:id])

    if current_user == @order.user || current_user.is_admin
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
