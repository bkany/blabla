class OrdersController < ApplicationController

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
          puts '###########################BEFORE####################################'
          puts @order_item.errors.messages
          item.destroy
        end
        flash.notice = "Votre commande a bien ete effectuer"
        redirect_to root_path
      else
        flash.alert = "Une erreur est survenue #{@order.errors.messages}"
        redirect_to cart_path(id: current_user.id)
      end
    end

  end
end
