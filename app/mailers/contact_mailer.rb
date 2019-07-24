class ContactMailer < ApplicationMailer
  def contact_mail(user)
    @user = user
    
    mail to: "junx0401@gmail.com", subject: "投稿を受け付けました！"
  end
end
