class CartsController < ApplicationController

	def show
		@user = User.find(params[:id])
		@cart = @user.cart
		@cart_items = @cart.items

		#@cart_items.each |cart_item| do
			# cart_item.title
		#end 
	end

	def new
		@cart_item = Cart_item.new
	end

	def create
		@cart_item = Cart_item.new(cart_item_params)
		#@event.admin = current_user

		if @cart_item.save
			flash.notice = "Votre produit a bien été ajouté à votre panier"
			#redirect_to @event
		else
			flash.alert = "Une erreur est survenue #{@cart_item.errors.messages}"
			render :show
		end
	end

	private

	def cart_item_params
		params.require(:cart_id, :item_id)
	end

end