class PlacesController < ApplicationController        
  respond_to :html, :js
  def index      
    @places = Array.new      
    if params[:lat]
      logger.debug "got a lat"
      options = {'category' => 'Restaurant'}
      @places = SimpleGeo::Client.get_places(params[:lat], params[:long], options)
      @places = @places[:features]              
      @context = SimpleGeo::Client.get_context(params[:lat], params[:long]) 
    end
  end    
  def show
  end
end
