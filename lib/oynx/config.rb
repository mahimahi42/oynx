class Web_Config < Hash
	def initialize()
		self["name"]    = "new_site"
		self["charset"] = "utf-8"
		self["css"]     = true
		self["js"]      = true
		self["img"]     = true
	end

	def to_s()
		ret = ""
		self.each_pair do |key, val|
			ret += "#{key}: #{val}\n"
		end
		return ret
	end
end