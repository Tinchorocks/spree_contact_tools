require 'spree_core'
require 'spree_extension'
require 'spree_contact_tools/engine'
require 'spree_contact_tools/version'

module Spree
  module ContactTools
    mattr_accessor :mailer_from
    mattr_accessor :mailer_to
    mattr_accessor :subject

    def self.config
      yield self
    end
  end
end
