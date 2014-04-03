require_relative './config'

class Oynx_Back
	attr_writer :config

	def initialize(config = Web_Config.new)
		@config = config
		@root = nil
	end

	def create_site()
		create_root()
		create_inner_folders()
		create_file_stubs()
	end

	def upload(compress)
		compress_site() if compress
		info = get_serv_info()
	end

	private

	##################
	# Creating methods
	##################

	def create_root()
		tmp = File.join(Dir.pwd, @config["name"])
		Dir.mkdir(tmp)
		@root = Dir.new(tmp)
	end

	def create_inner_folders()
		create_css_folder()
		create_img_folder()
		create_js_folder()
	end

	def create_css_folder()
		if @config["css"]
			css = File.join(@root, "css")
			Dir.mkdir(css)
		end
	end

	def create_img_folder()
		if @config["img"]
			img = File.join(@root, "img")
			Dir.mkdir(img)
		end
	end

	def create_js_folder()
		if @config["js"]
			js = File.join(@root, "js")
			Dir.mkdir(js)
		end
	end

	def create_file_stubs()
		index_text = "<!DOCTYPE HTML>
			<html>
				<head>
					<meta charset='#{@config["charset"]}'>
					<meta name='viewport' content='width=device-width,initial-scale=1.0'>
					<link rel='stylesheet' type='text/css' href='css/styles.css'>
				</head>

				<body>

					<!-- Scripts at the end for faster page loading -->
					<script src='js/scripts.js'></script>
				</body>
			</html>"

		index_file = File.join(@root, "index.html")
		File.open(index_file, "a") {|f| f.write(index_text)}

		create_css_file_stubs()
		create_js_file_stubs()
	end

	def create_css_file_stubs()
		if @config["css"] then
			css_file = File.join(@root, "css/styles.css")
			File.open(css_file, "a")
		end
	end

	def create_js_file_stubs()
		if @config["js"] then
			js_file = File.join(@root, "js/scripts.js")
			File.open(js_file, "a")
		end
	end

	###################
	# Uploading methods
	###################

	# Compresses the site
end