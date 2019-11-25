module Spree
  class ContactToolsMailer < BaseMailer
    def contact_email(contact)
      @contact = contact
      from = Spree::ContactTools.mailer_from
      to= Spree::ContactTools.mailer_to
      subject = Spree::ContactTools.subject || Spree.t('contact_tools.contact.email_subject')
      mail(to: to, from: from, reply_to: @contact.email, subject: subject)
    end
  end
end
