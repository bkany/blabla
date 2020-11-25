class UserMailer < ApplicationMailer
  default from: 'no-reply@kittenshop.fr'

  def welcome_email(user)
    @user = user
    @url = "kittenshop.herokuapp.com/login"
    mail(to: @user.email, subject: "Bienvenue chez KittenShop !")
  end

end
