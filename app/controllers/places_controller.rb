class PlacesController < ApplicationController        
  def index      
    @places = Array.new      
    if params[:lat]
      logger.debug "got a lat"
      @places = SimpleGeo::Client.get_places(params[:lat], params[:long])      
    else
      @places = SimpleGeo::Client.get_places(45.515493,-122.643059)      
    end
    respond_to do |format|
       format.html
       format.js
       format.xml
    end
  end
end
