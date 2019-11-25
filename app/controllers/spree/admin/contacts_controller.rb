module Spree
  module Admin
    class ContactsController < ResourceController
      def index
        respond_to do |format|
          format.html { Spree::Contact.all }
          format.csv { send_data Spree::Contact.to_csv, filename: "#{Spree.t('contact_tools.contact')}s-#{Date.today}.csv" }
        end
      end

      def show
        @contact = Spree::Contact.find(params[:id])
      end

      def new
        @contact = Spree::Contact.new
      end

      def create
        @contact = Spree::Contact.new(contact_params)
        if @contact.save
          redirect_to :index
        else
          render :new
        end
      end

      def edit
        @contact = Spree::Contact.find(params[:id])
      end

      def update
        @contact = Spree::Contact.find(params[:id])
        if @contact.update_attributes(contact_params)
          redirect_to :show, id: @contact
        else
          render :edit
        end
      end

      def delete
        Spree::Contact.find(params[:id]).destroy
        redirect_to :index
      end

      def contact_params
        params.require(:contact).permit(%i[firstname lastname email phone message])
      end
    end
  end
end
