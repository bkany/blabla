class CartsController < ApplicationController

	def show
		@user = User.find(params[:id])
		@cart = @user.cart
		@cart_items = @cart.items
	end

end