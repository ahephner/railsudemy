class PortfoliosController < ApplicationController

  #here you can limit what returns like Portfolio.all or Portfolio.where(subtitle: "SQL")
    def index
        @port_items = Portfolio.all
    end

        #only renders does not create!
    def new
        @port_items = Portfolio.new
        3.times {@port_items.technologies.build}
    end

    def create                     #from private at the bottom
        @port_items = Portfolio.new(portfolio_params)
    
        respond_to do |format|
          #if blog is valid
          if @port_items.save
            #redirect_to portfolio main page. use rake routes to see where you can send
            format.html { redirect_to portfolios_path, notice: 'Your Portfolio was successfully created.' }
            #dont need this to get up and running its for api
            #format.json { render :show, status: :created, location: @blog }
          else
            format.html { render :new }
            Eformat.json { render json: @blog.errors, status: :unprocessable_entity }
          end
        end
    end

    def edit
        #tell it what one to look up based on URI like portfolio/1/edit - the 1 is the id 
        @port_items = Portfolio.find(params[:id])
    end
    def update
                                     #from below private       
        @port_items = Portfolio.find(params[:id])
        
        respond_to do |format|
          if @port_items.update(portfolio_params)
            format.html { redirect_to portfolios_path, notice: 'Portoflio was successfully updated.' }
            #format.json { render :show, status: :ok, location: @blog }
          else
            format.html { render :edit }
            #format.json { render json: @blog.errors, status: :unprocessable_entity }
          end
        end
      end

    def show
        @port_items = Portfolio.find(params[:id]) 
    end
    def destroy
        #perform look up on id
        @port_items = Portfolio.find(params[:id]) 
        #destroy record
        @port_items.destroy
        #redirect after destroying 
        respond_to do |format|
          format.html { redirect_to portfolios_url, notice: 'Recorded was removed' }
          
        end
      end

#Want to add a new Item to the page have to add it below      
      private 
      def portfolio_params
        params.require(:portfolio).permit(:title, 
                                          :subtitle, 
                                          :body, 
                                          technologies_attributes: [:name]
                                          )
      end
end
