require 'csv'

module Spree
  class Newsletter < Spree::Base
    include ActiveModel::Conversion
    include ActiveModel::Validations

    EMAIL_REGEX = /\A
	  [^\s@]+ # non-at-sign characters, at least one
	  @       # at-sign
      [^\s.@] # non-at-sign and non-period character
      [^\s@]* # 0 or more non-at-sign characters, accepts any number of periods
      \.      # period
      [^\s@]* # 0 or more non-at-sign characters, accepts any number of periods
  [^\s.@] # non-at-sign and non-period character
	  \z/x

    validates :email, format: { with: EMAIL_REGEX }, presence: true, uniqueness: true

    def self.to_csv
      CSV.generate(headers: true) do |csv|
        csv << [Spree.t('contact_tools.newsletters.id'), Spree.t('contact_tools.newsletters.email')]
        all.each do |newsletter|
          csv << [newsletter.id, newsletter.email]
        end
      end
    end
  end
end
