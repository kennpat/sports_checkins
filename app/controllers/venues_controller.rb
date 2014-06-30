class VenuesController < ApplicationController
	require 'geocoder'
	def index
		#how do I get this to return our latitude and longitude, consult the GeoCode github?
		@location = Geocoder.search(request.remote_ip).first.city

		ll = "#{Geocoder.search(request.remote_ip).first.latitude}, #{Geocoder.search(request.remote_ip).first.longitude}"
		#foursquare.search_venues_by_tip(:ll => @location, :query => 'bars')
		@special_venues = []
		foursquare.search_specials(:ll => ll, :radius => 10000 ).specials.each do |venue|
			if venue.specials['count'] > 0
				@special_venues << venue

			end
		end
	end
end