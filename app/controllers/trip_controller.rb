class TripController < ApplicationController
  def new
	@trip = Trip.new
    @user= session[:current_user].id
	@friends = []
	for each in session[:friends_list]
		@friends.push(each.name.to_s)
	end
    if @user != nil  #if session id is set
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @friends }
      end
    else
      redirect_to 'http://localhost:5000/auth/facebook', :notice => "You have to login to post a question"
    end

  end
  
  def create
	@trip = Trip.new
	@trip.name = params[:name]
	@trip.user_id = params[:id]
	@trip.save
	
	#need to actually redirect to location and pass params. rem to modify
	@location = Location.new
	###********** As of now, have added the whole address. This needs to be split into city n country and entered to db
	@location.address = params[:start]
	s = Geocoder.search(params[:start])
	@location.latitude = s[0].latitude
	@location.longitude = s[0].longitude
	@location.save
	
	@itinerary = Itinerary.new
	@itinerary.trip_id = @trip.id
	@itinerary.location_id = @location.id
	@itinerary.order = 0
	@itinerary.save
	
	@location2 = Location.new
	###********** As of now, have added the whole address. This needs to be split into city n country and entered to db
	@location2.address = params[:end]
	s = Geocoder.search(params[:end])
	@location2.latitude = s[0].latitude
	@location2.longitude = s[0].longitude
	@location2.save
	
	@itinerary2 = Itinerary.new
	@itinerary2.trip_id = @trip.id
	@itinerary2.location_id = @location2.id
	@itinerary2.order = 9999 #max num
	@itinerary2.save
	
	redirect_to :controller=>"user" , :action=>"show", :id=>params[:id]
	
		#redirect_to :controller => "location", :action => "new", :id=>
  
  
  end

end
