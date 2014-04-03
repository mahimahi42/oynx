class Web_Config
	attr_reader :config

	def initialize()
		@config = {}
	end

	def set_name(name)
		@config["name"] = name
	end

	def set_charset(chst)
		@config["charset"] = chst
	end

	def to_s()
		ret = ""
		@config.each_pair do |key, val|
			ret += "#{key}: #{val}\n"
		end
		return ret
	end
end