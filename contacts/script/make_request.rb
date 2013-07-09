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
  path: '/users/70'
).to_s

p RestClient.get(url)