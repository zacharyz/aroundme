class PagesController < ApplicationController
  def home
    respond_to do |format|
       format.html
       format.js
       format.xml
    end
  end
  def index
    
    respond_to do |format|
       format.html
       format.js
       format.xml
    end
  end
  def places 
    SimpleGeo::Client.set_credentials('Prhfx4xKNBYnxLnaersACEKEtusVZNmp', 'hMu2vMCcGC4Z67QEwq8DpgMm5fEDLcvq')
    @places = Array.new
    
    if params[:lat]
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
