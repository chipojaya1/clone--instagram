class ContactMailer < ApplicationMailer
  def contact_mail(contact)
    @pcontact = contact
    mail to: "your email here",  subject: "Inquiry email confirmation"
  end
end
