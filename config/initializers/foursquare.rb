
def foursquare 
	Foursquare2::Client.new(
		:client_id => ENV['FOURSQUARE_CLIENT_ID'], 
		:client_secret => ENV['FOURSQUARE_CLIENT_SECRET'],
		:api_version => '20120505'
		)

end