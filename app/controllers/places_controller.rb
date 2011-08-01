class PlacesController < ApplicationController        
  def index      
    @places = Array.new      
    if params[:lat]
      logger.debug "got a lat"
      options = {'category' => 'Restaurant'}
      @places = SimpleGeo::Client.get_places(params[:lat], params[:long], options)
      @places = @places[:features]          
    end
    respond_to do |format|
       format.html
       format.js       
       format.xml
    end
  end    
  def show
     respond_to do |format|
         format.html
         format.js       
         format.xml
      end
  end
end
