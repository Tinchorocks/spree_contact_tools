require 'recaptcha/rails'

module Spree
  class ContactsController < Spree::StoreController
		def new
			@contact = Spree::Contact.new
   	end
   
		 def create
			@contact = Spree::Contact.new(contact_params)
			verify = Recaptcha.configuration.site_key && Recaptcha.configuration.secret_key ? verify_recaptcha(model: @contact) : true

			if verify   
				if @contact.save
					@contact.deliver_email
					render :success
				else
					render :new
				end
			else
				flash[:error] = Spree.t('contact_tools.contacts.recaptcha_validation_error')
				render :new
			end
   	end
   
		def success; end

		def contact_params
			params.require(:contact).permit(%i[firstname lastname email phone message])
   	end
  end
end