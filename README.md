# Oynx

Do you find yourself wasting hours creating folder skeletons for your websites?
Do you hate having to remember `tar`'s many arguments?
Do you love you some good Ruby?

Then Oynx is for you! Use Oynx to simplify many aspects of web development

### Note
Oynx is currently alpha-stage. Don't expect anything to work. In fact, be surprised if
anything does.

## Installation

Add this line to your application's Gemfile:

    gem 'oynx'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install oynx

## Usage

	$ oynx new

### Parameters

	--default      - create a default site

	OR

	--name NAME    - Specify site name
	--charset CHSH - Specify the charset to use
	--no-css       - Don't create a CSS folder/stubs
	--no-img       - Don't create an image folder
	--no-js        - Don't create a JS folder/stubs

## Contributing

1. Fork it ( http://github.com/<my-github-username>/oynx/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
