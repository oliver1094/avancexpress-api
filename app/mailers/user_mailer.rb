class UserMailer < ApplicationMailer
  default from: 'contacto@avancexpress.com.mx'

  def welcome_email(user, client)
    @user = user
    @client = client
    @url  = 'http://localhost:4800/?client_key='+ @client.client_key
    attachments.inline["slogan.png"] = File.read("#{Rails.root}/public/images/slogan.png")
    attachments.inline["slogan2.png"] = File.read("#{Rails.root}/public/images/slogan10.png")
    mail(to: @user.email, subject: 'Confirmación de datos')
  end
end
