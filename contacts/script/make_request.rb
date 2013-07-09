require 'addressable/uri'
require 'rest_client'
require 'json'

# # url = Addressable::URI.new(
# #   scheme: 'http',
# #   host: 'localhost',
# #   port: 3000,
# #   path: '/users.json'
# # ).to_s
# #
# # name = "Bob"
# # email = "Bob@bob.bob"
# #
# # RestClient.post(url, :user => {:name => name, :email => email})
#
# # url = Addressable::URI.new(
# #   scheme: 'http',
# #   host: 'localhost',
# #   port: 3000,
# #   path: '/session',
# # ).to_s
# #
# # params = {:email => "Anthony@anthony.anthony", :password => "password1234"}
# # p token = JSON.parse(RestClient.post(url, params))["token"]
#
# url = Addressable::URI.new(
#   scheme: 'http',
#   host: 'localhost',
#   port: 3000,
#   path: '/session',
#   query_values: {:token => "zI4Gpbbwrt2gQS21qjcZvw"}
# ).to_s
#
# # "xaGK44lw8Jyf9QnsmQDFHQ"
# # params = {:contact => {:address => "12487912lfsajklafs" }}
# p RestClient.delete(url)

class ContactsSDK
  attr_reader :token

  def initialize(email = nil, username = nil)
    @token = nil
    login(email, username) if email && username
  end

  def login(email, password)
    params = { :email => email, :password => password }
    url = get_url("/session")
    @token = JSON.parse(RestClient.post(url, params))["token"]
  end

  def logout
    url = get_url("/session", {token: @access_token})
    @token = nil
    JSON.parse(RestClient.delete(url, params))
  end

  def get(path)
    url = get_url(path, {token: @token})
    JSON.parse(RestClient.get(url))
  end

  def post(path, params = {})
    url = get_url(path, {token: @token})
    JSON.parse(RestClient.post(url, params))
  end

  def put(path, params = {})
    url = get_url(path, {token: @token})
    JSON.parse(RestClient.put(url, params))
  end

  def delete(path)
    url = get_url(path, {token: @atoken})
    JSON.parse(RestClient.delete(url))
  end

  private
    def get_url(path, query_values = {})
      Addressable::URI.new(
        scheme: 'http',
        host: 'localhost',
        port: 3000,
        path: path,
        query_values: query_values
      ).to_s
    end
end