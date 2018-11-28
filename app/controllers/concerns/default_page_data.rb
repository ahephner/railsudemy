module DefaultPageData
    extend ActiveSupport::Concern
  
    included do
        before_action :set_title
    end

    def set_title
        @page_title = 'AJ Hephner' 
        @seo_keywords = "AJ Hephner, portfolio, advanced, turf, IT"   
    end
    
end