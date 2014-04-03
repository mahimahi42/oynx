class Oynx_Back
	attr_writer :config

	def initialize(config = {"name"=>"new_site", "charset"=>"utf-8"})
		@config = config
		@root = nil
	end

	def create_site()
		create_root()
		create_inner_folders()
		create_file_stubs()
	end

	private

	def create_root()
		tmp = File.join(Dir.pwd, @config["name"])
		Dir.mkdir(tmp)
		@root = Dir.new(tmp)
	end

	def create_inner_folders()
		css = File.join(@root, "css")
		img = File.join(@root, "img")
		js  = File.join(@root, "js")

		Dir.mkdir(css)
		Dir.mkdir(img)
		Dir.mkdir(js)
	end

	def create_file_stubs()
		index_text = "<!DOCTYPE HTML>
			<html>
				<head>
					<meta charset='#{@config["charset"]}'>
					<meta name='viewport' content='width=device-width,initial-scale=1.0'>
				</head>

				<body>

				</body>
			</html>"

		index_file = File.join(@root, "index.html")
		css_file   = File.join(@root, "css/styles.css")
		js_file    = File.join(@root, "js/scripts.js")

		File.open(index_file, "a") {|f| f.write(index_text)}
		File.open(css_file, "a")
		File.open(js_file, "a")
	end
end