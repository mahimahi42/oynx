require './config'

class Oynx
	attr_writer :config

	def initialize(config = {})
		@config = config
	end
end