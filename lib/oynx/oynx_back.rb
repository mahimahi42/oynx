require "rubygems"
require "zip"

require_relative './config'

class Oynx_Back
	attr_writer :config, :root

	def initialize(config = Web_Config.new)
		@config = config
		@root = nil
	end

	def create_site()
		create_root()
		create_inner_folders()
		create_file_stubs()
	end

	def Oynx_Back.upload(options, site_name, dir)
		user  = options[:user]
		dir   = options[:dir]
		server = options[:server]
		port = options[:port]
		compress = options[:compress] if not options[:compress] else true
		if options[:compress] then
			Oynx_Back.compress_site(site_name)
			system "scp -P #{port} #{site_name}.zip #{user}@#{server}:#{dir}/#{site_name}.zip"
		else
			system "scp -P #{port} -r #{site_name} #{user}@#{server}:#{dir}/#{site_name}"
		end
	end

	private

	##################
	# Creating methods
	##################

	def create_root()
		tmp = File.join(Dir.pwd, @config["name"])
		Dir.mkdir(tmp)
		@root = tmp
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
	def Oynx_Back.compress_site(name)
		archive  = File.join(Dir.pwd, "#{name}.zip")
		arch_dir = File.join(Dir.pwd, "#{name}")
		files    = Dir[File.join(arch_dir, "**", "**")]

		Zip::File.open(archive, Zip::File::CREATE) do |zipfile|
			files.each do |file|
				filename = "#{arch_dir}/#{file}"
		      	zipfile.add(file.sub("#{arch_dir}/", ""), file)
		    end
		end
	end
end