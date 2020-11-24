class CartsController < ApplicationController

	def show
		@user = User.find(params[:id])
		@cart = @user.cart
		@cart_items = @cart.items
	end

	# def new
	# 	@cart_item = Cart_item.new
	# end

	def create


	#From -User cart
	#
		@item_id = Item.find(params[:id]).id
		@cart_id = current_user.cart.id

		# @cart_item = Cart_item.new(cart_item_params)
		@cart_item = Cart_item.new(cart_id: @cart_id, item_id: @item_id)

		if @cart_item.save
			flash.notice = "Votre produit a bien été ajouté à votre panier"
			redirect_to root_path
		else
			flash.alert = "Une erreur est survenue #{@cart_item.errors.messages}"
			render :show
		end
	end

	private

	# def cart_item_params
	# 	params.require(:cart_id, :item_id)
	# end

end