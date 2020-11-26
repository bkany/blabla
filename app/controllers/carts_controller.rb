class CartsController < ApplicationController
	before_action :require_cart

	def show
		@user = User.find(params[:id])
		@cart = @user.cart
		@cart_items = @cart.items
	end

	def user_cart?
		@user = User.find(params[:id])
		@cart = @user.cart
		if current_user && @cart == current_user.cart
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