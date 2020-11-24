class CartItemsController < ApplicationController

	def create

		@item = Item.find(params[:item_id])
		@item_id = @item.id
		@cart_id = current_user.cart.id

		@cart_item = CartItem.new(cart_id: @cart_id, item_id: @item_id)

		if @cart_item.save
			flash.notice = "Votre produit a bien été ajouté à votre panier"
			redirect_to root_path
		else
			flash.alert = "Une erreur est survenue #{@cart_item.errors.messages}"
			render :show
		end
	end

	def destroy
		@cart_id = current_user.cart.id
		@cart_item = CartItem.find_by(cart_id:@cart_id, item_id:params[:item_id])

		if @cart_item.destroy
			flash.notice = "Votre produit a bien été SUPPRIME"
			redirect_to cart_path(current_user.id)
		else
			flash.alert = "Une erreur est survenue #{@cart_item.errors.messages}"
			render :carts_path
		end
	end

end
