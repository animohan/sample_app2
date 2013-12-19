# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.

#SampleApp2::Application.config.secret_key_base = '6ead6434ed072a74492acb15ec16ed17241c1b0db24dd558a7dc0df74b7e998d10ebc115766511db4f8a9d94cfd191bdf34e9a37e274c987c2630368fb99d988'

require 'securerandom'
def secure_token
	token_file = Rails.root.join('.secret')
	if File.exist?(token_file)
		#use the existing token_file
		File.read(token_file).chomp
	else
		#generate a new token and store in token_file
		token = SecureRandom.hex(64)
		File.write(token_file,token)
		token
	end
end

SampleApp2::Application.config.secret_key_base=secure_token