module Spree
  module Admin
    class NewslettersController < ResourceController
      def index
        respond_to do |format|
          format.html { Spree::Newsletter.all }
          format.csv { send_data Spree::Newsletter.to_csv, filename: "#{Spree.t('contact_tools.newsletter')}-#{Date.today}.csv" }
        end
      end

      def delete
        Spree::Newsletter.find(params[:id]).destroy
        redirect_to :index
      end

      def newsletter_params
        params.require(:newsletter).permit(:email)
      end
    end
  end
end
