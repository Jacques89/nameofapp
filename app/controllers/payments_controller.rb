class PaymentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @product = Product.find(params[:product_id])
    @user = current_user
    token = params[:stripeToken]
    # Create the charge on Stripe's servers - this will charge the user's card
    begin
      charge = Stripe::Charge.create(
        amount: (@product.price*100).to_i, # amount in cents, again
        currency: "eur",
        source: token,
        description: params[:stripeEmail]
      )

    if charge.paid
      UserMailer.order_confirmation(@user, @product).deliver_now
      Order.create!(
        :product_id => @product.id,
        :user_id => @user.id,
        :total => @product.price
      )
        flash[:notice] = "Your payment was processed successfully"
    end

    rescue Stripe::CardError => e
      # The card has been declined
      body = e.json_body
      err = body[:error]
      flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]} Your card has not been charged. Please try again."
    end
    redirect_to product_path(@product)
  end
end
