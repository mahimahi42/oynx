module Setup
	def Setup.welcome()
		puts "Welcome to Oynx!"
		puts "This tool will simplify your life as a web guru."
		puts "\n\n"
	end

	def Setup.get_site_info()
		puts "First, let's get some info about the site."
		name = Setup.get_site_name()
		puts name
	end

	private

	def Setup.get_site_name()
		print "Website Name: "
		gets.chomp!
	end
end