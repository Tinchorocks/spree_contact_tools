require 'recaptcha/rails'

module Spree
  module Admin
    class ContactsController < ResourceController
      def index
        respond_to do |format|
          format.html { Spree::Contact.all }
          format.csv { send_data Spree::Contact.to_csv, filename: "#{Spree.t('contact_tools.contact')}s-#{Date.today}.csv" }
        end
      end

      def delete
        Spree::Contact.find(params[:id]).destroy
        redirect_to :index
      end

      def settings; end

      def update_settings
        Spree::ContactTools.mailer_from = params[:mailer_from]
        Spree::ContactTools.mailer_to = params[:mailer_to]
        Spree::ContactTools.subject = params[:subject] 
        Recaptcha.configuration.site_key = params[:site_key]
        Recaptcha.configuration.secret_key = params[:secret_key]
        flash[:notice] = Spree.t('contact_tools.contacts.admin.settings_success_msg')
        render :settings
      end

      def contact_params
        params.require(:contact).permit(%i[firstname lastname email phone message])
      end
    end
  end
end
