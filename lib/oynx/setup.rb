require_relative './config'

module Setup
	def Setup.welcome()
		puts "Welcome to Oynx!"
		puts "This tool will simplify your life as a web guru."
		puts "\n\n"
	end

	def Setup.get_site_info()
		puts "First, let's get some info about the site."
		name = Setup.get_site_name()
		chst = Setup.set_charset()
		c = Setup.finish_config(name, chst)
	end

	private

	def Setup.get_site_name()
		print "Website Name: "
		gets.chomp!
	end

	def Setup.set_charset()
		charset = "utf-8"
		print "Charset [#{charset}]: "
		input = gets.chomp!
		case input
			when ""
				return charset
			else
				return input
		end
	end

	def Setup.finish_config(name, chst)
		config = Web_Config.new
		config.set_name(name)
		config.set_charset(chst)
		return config
	end
end