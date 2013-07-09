require 'addressable/uri'
require 'rest_client'

# url = Addressable::URI.new(
#   scheme: 'http',
#   host: 'localhost',
#   port: 3000,
#   path: '/users.json'
# ).to_s
#
# name = "Bob"
# email = "Bob@bob.bob"
#
# RestClient.post(url, :user => {:name => name, :email => email})

url = Addressable::URI.new(
  scheme: 'http',
  host: 'localhost',
  port: 3000,
  path: '/favorites/3'
).to_s

# params = {:contact => {:address => '222 Broadway',
#     :email => 'maybeyesapp@appacademy.io',
#     :name => 'maybeyesGeorge',
#     :phone_number => '222-123-1234',
#     :user_id => 1}}
params = {:favorite => {:user_id => 2, :contact_id => 2}}
p RestClient.delete(url)