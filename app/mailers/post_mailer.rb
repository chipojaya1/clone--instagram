class PostMailer < ApplicationMailer
  def post_mail (post)
    @post = post
    mail to: "Your own email address",  subject: "Inquiry email confirmation"
  end
end
