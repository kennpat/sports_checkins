if Rails.env == 'test' || Rails.env == 'development'
	class ActionDispatch::Request
		def remote_ip
			`curl http://www.curlmyip.com`.strip
		end
	end
	
end
