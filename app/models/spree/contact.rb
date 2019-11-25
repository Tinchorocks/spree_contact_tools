require 'csv'

module Spree
  class Contact < Spree::Base
    include ActiveModel::Conversion
    include ActiveModel::Validations

    EMAIL_REGEX = /\A
    [^\s@]+ # non-at-sign characters, at least one
    @     # at-sign
    [^\s.@] # non-at-sign and non-period character
    [^\s@]* # 0 or more non-at-sign characters, accepts any number of periods
    \.     # period
    [^\s@]* # 0 or more non-at-sign characters, accepts any number of periods
    [^\s.@] # non-at-sign and non-period character
    \z/x

    validates :email, format: { with: EMAIL_REGEX }, presence: true
    validates :message, presence: true
    validates :firstname, presence: true
    validates :lastname, presence: true

    def deliver_email
      Spree::ContactToolsMailer.contact_email(self).deliver_now
    end

    def self.to_csv
      CSV.generate(headers: true) do |csv|
        csv << [Spree.t('contact_tools.contacts.email'), Spree.t('contact_tools.contacts.firstname'), Spree.t('contact_tools.contacts.lastname'), Spree.t('contact_tools.contacts.phone'), Spree.t('contact_tools.contacts.message')]
        all.each do |contact|
          csv << [contact.email, contact.firstname, contact.lastname, contact.phone, contact.message]
        end
      end
    end
  end
end
