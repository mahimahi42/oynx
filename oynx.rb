#require './config'

class Oynx
	attr_writer :config

	def initialize(config = {})
		@config = config
		@root = nil
	end

	def create_site()
		create_root()
	end

	def create_root()
		tmp = File.join(Dir.pwd, @config["name"])
		Dir.mkdir(tmp)
		@root = Dir.new(tmp)
	end

	def create_inner_folders()

	end
end