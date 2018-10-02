class PortfoliosController < ApplicationController

    def index
        @port_items = Portfolio.all 
    end




    
end
