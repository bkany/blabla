module ItemsHelper

  def already_in_cart?
    @item = Item.find(params[:id])
    if current_user
      @cart = current_user.cart
    end
    if CartItem.find_by(cart_id: @cart, item_id: @item)
      return true
    else
      return false
    end
  end

end
