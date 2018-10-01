class PortfoliosController < ApplicationController

    def index
        @port = Portfolio.all 
    end




    
end
