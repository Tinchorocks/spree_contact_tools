module Spree
  class ContactsController < Spree::StoreController
		def new
			@contact = Spree::Contact.new
   	end
   
   	def create
    	@contact = Spree::Contact.new(contact_params)
    	if @contact.save
				@contact.deliver_email
				render :success
    	else
      	render :new
    	end
   	end
   
		def success; end

		def contact_params
			params.require(:contact).permit(%i[firstname lastname email phone message])
   	end
  end
end