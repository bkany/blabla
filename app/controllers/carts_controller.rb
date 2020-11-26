class CartsController < ApplicationController

	def show
		@user = User.find(params[:id])
		@cart = @user.cart
		@cart_items = @cart.items
	end
	
	def paymentvalidation 
		@total = @cart.(&:item.price)

		customer = Stripe::Customer.create({
		  email: params[:stripeEmail],
		  source: params[:stripeToken],
		})

		charge = Stripe::Charge.create({
		  customer: customer.id,
		  amount: @total,
		  description: "Payment of #{@user.first_name} #{@user.last_name}",
		  currency: 'eur',
		})

		rescue Stripe::CardError => e
			flash[:error] = e.message
			redirect_to new_charge_path
		end
	
	end

end
