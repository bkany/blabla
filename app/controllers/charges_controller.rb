class ChargesController < ApplicationController

	def new

	end

	def create 
		@total = current_user.cart.total_stripe.to_i
		customer = Stripe::Customer.create({
			email: params[:stripeEmail],
			source: params[:stripeToken],
		})

		charge = Stripe::Charge.create({
			customer: customer.id,
			amount: @total,
			description: "Payment of #{current_user.first_name} #{current_user.last_name}",
			currency: 'eur',
		})
		#redirect_to orders_path
		#redirect_to orders_path, :action => '#create'
		redirect_to orders_path, action: :create, method: :post

	rescue Stripe::CardError => e
		flash[:error] = e.message
		redirect_to new_charge_path
	end

end