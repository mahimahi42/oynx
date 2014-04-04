##
# Web_Config is just a wrapper for a Hash with some custom keys
# instantiated for Oynx use.

class Web_Config < Hash
	##
	# Set our custom keys to default values
	def initialize()
		self["name"]    = "new_site"
		self["charset"] = "utf-8"
		self["css"]     = true
		self["js"]      = true
		self["img"]     = true
	end

	##
	# Our Web_Config as a String
	def to_s()
		ret = ""
		self.each_pair do |key, val|
			ret += "#{key}: #{val}\n"
		end
		return ret
	end
end