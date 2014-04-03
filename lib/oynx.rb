require "thor"

require "oynx/version"
require "oynx/oynx_back"

module Oynx
  	class Oynx_CLI < Thor
  		desc "new", "create a new website"
  		long_desc <<-LONGDESC
  			`oynx new` will create a new website in the current directory.

  			Optional Parameters
  			\x5-------------------

  			--default        - Create a site with default information.

  			--name "NAME"    - Specify the site's name.
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
  				config = {}
  				
  				config["name"] = options[:name] if options[:name]
  				config["charset"] = options[:charset] if options[:charset]
  				config["css"] = options[:css] if not options[:css]
  				config["js"] = options[:js] if not options[:js]
  				config["img"] = options[:img] if not options[:img]

  				Oynx_Back.new(config).create_site
  			end
  		end
  	end
end
