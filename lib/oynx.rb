require "thor"

require "oynx/version"
require "oynx/oynx_back"
require "oynx/config"

module Oynx
  	class Oynx_CLI < Thor
      attr_accessor :site

  		desc "new", "create a new website"
  		long_desc <<-LONGDESC
  			`oynx new` will create a new website in the current directory.

  			Optional Parameters
  			\x5-------------------

  			--default, -d       - Create a site with default information.

  			--name "NAME"       - Specify the site's name.
  			\x5--charset "CHST" - Specify the charset to use.
  			\x5--no-css         - Don't create a CSS folder or stubs.
  			\x5--no-img         - Don't create an image folder.
  			\x5--no-js          - Don't create a JS folder or stubs.
  		LONGDESC
  		option :default, :type => :boolean, :aliases => :d
  		option :name
  		option :charset
  		option :css, :type => :boolean
  		option :js, :type => :boolean
  		option :img, :type => :boolean
  		def new
  			if options[:default] then
                Oynx_Back.new.create_site()
  			else
  				config["name"] = options[:name] if options[:name]
  				config["charset"] = options[:charset] if options[:charset]
  				config["css"] = options[:css] if not options[:css]
  				config["js"] = options[:js] if not options[:js]
  				config["img"] = options[:img] if not options[:img]

  				@site = Oynx_Back.new(config).create_site
  			end
  		end

        desc "upload", "upload site to a server"
        long_desc <<-LONGDESC
            `oynx upload` will upload the site to a server.

            Required Parameters
            \x5-------------------

            --server, -s "URL/IP" - Server URL/IP Address
            \x5--port, -n "PORT"     - Port to use
            \x5--user, -u "USERNAME" - Username
            \x5--pass, -p "PASSWORD" - Password
            \x5--dir, -d "DIRECTORY" - Directory to use
            \x5--compress, -c / --no-compress - Compresses the site / Doesn't compress the site
        LONGDESC
        option :server, :aliases => :s, :required => true
        option :port, :aliases => :n, :type => :numeric, :required => true
        option :user, :aliases => :u, :required => true
        option :dir, :aliases => :d, :required => true
        option :compress, :aliases => :c, :type => :boolean
        def upload
            Oynx_Back.upload(options, config["name"], File.join(Dir.pwd, config["name"]))
        end

        private

        def config
            @config ||= Web_Config.new
        end
  	end
end
