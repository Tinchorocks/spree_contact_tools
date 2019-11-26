module Spree
  class NewslettersController < Spree::StoreController
    def new
      @newsletter = Spree::Newsletter.new
    end

    def create
      @newsletter = Spree::Newsletter.new(newsletter_params)
      if @newsletter.save
        respond_with(@newsletter) do |format| 
          format.json { render json: {"status":"ok","msg":"#{Spree.t('contact_tools.newsletters.success_msg')}"} }
        end
      else
        respond_with(@newsletter) do |format| 
          format.json { render json: {"status":"fail","msg":@newsletter.errors.full_messages.join('\n')} }
        end

      end
    end

    def newsletter_params
      params.require(:newsletter).permit(:email)
    end
  end
end
