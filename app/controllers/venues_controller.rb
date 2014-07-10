class VenuesController < ApplicationController
	require 'geocoder'
	def index
		#how do I get this to return our latitude and longitude, consult the GeoCode github?

		@location = Geocoder.search(request.remote_ip).first.city

		ll = "#{Geocoder.search(request.remote_ip).first.latitude}, #{Geocoder.search(request.remote_ip).first.longitude}"
		#foursquare.search_venues_by_tip(:ll => @location, :query => 'bars')
		# @special_venues = []
		# foursquare.search_venues(:ll => ll, intent: "browse", :radius => "600", query: "bar" ).venues.each do |venue|
		# 	if venue.specials['count'] > -1
		# 		@special_venues << venue

			#end
		#end
	end

	def search
		
		#how do I get this to return our latitude and longitude, consult the GeoCode github?
		@location = Geocoder.search(request.remote_ip).first.city

		ll = "#{Geocoder.search(request.remote_ip).first.latitude}, #{Geocoder.search(request.remote_ip).first.longitude}"
		#foursquare.search_venues_by_tip(:ll => @location, :query => 'bars')
		@special_venues = []
		begin
		foursquare.search_venues(
			near: search_params, 
			intent: "browse", 
			radius: "600", 
			query: "bar" ).venues.each do |venue|
				if venue.specials['count'] > -1
					@special_venues << venue
				end
			end
			flash[:notice] = ''
		rescue
			flash[:notice] ="There is no result for your search, try exact names"

		end
	end

	def search_params
		params['venue']
	end

end