class CartsController < ApplicationController
	before_action :require_cart

	def show
		@user = User.find(params[:id])
		@cart = @user.cart
		@cart_items = @cart.items
		@total = total
	end

	def total
	total = 0
		@cart_items.each do |t|
			total += t.price

		end
		return total
	end

	def user_cart?
		@user = User.find(params[:id])
		@cart = @user.cart
		if @cart == current_user.cart
			return true
		else 
			return false
		end
	end

	def require_cart
    unless user_cart?
      flash[:error] = "You tried the wrong cart"
      redirect_to root_path 
    end
  end

end