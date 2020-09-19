class PostMailer < ApplicationMailer
  def post_mail (post)
    @post = post
    mail to: "My email address",  subject: "Inquiry email confirmation"
  end
end
