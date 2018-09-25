class UserMailer < ApplicationMailer
  default from: "from@example.com"

  def contact_form(email, name, message)
  @message = message
    mail(from: email,
         to: 'jacknalletamby@gmail.com',
         subject: "A new contact form message from #{name}")
  end

  def welcome(user)
    @appname = "Bike-Shop"
    mail(to: user.email, subject: "Welcome to #{@appname}!")
  end

  def order_confirmation(user, product)
   @product = product
   @appname = "Bike-Shop"
   mail(to: user.email, subject: "Order confirmation at the #{@appname} online shop")
 end
end
