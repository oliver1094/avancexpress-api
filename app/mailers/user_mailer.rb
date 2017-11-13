class UserMailer < ApplicationMailer
  default from: 'notification@avancexpress.com.mx'

  def welcome_email(user, client)
    @user = user
    @client = client
    @url = 'http://avancexpress.com.mx/#/register-complete?client_key='+ @client.client_key
    attachments.inline["slogan.png"] = File.read("#{Rails.root}/public/images/slogan.png")
    attachments.inline["slogan2.png"] = File.read("#{Rails.root}/public/images/slogan10.png")
    mail(to: @user.email, subject: 'Confirmación de datos')
  end


  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_signup_email()
    mail( :to => 'j.padilla.chi@gmail.com',
          :subject => 'Thanks for signing up for our amazing app' )
  end

end
