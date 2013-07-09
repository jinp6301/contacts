require 'addressable/uri'
require 'rest_client'
require 'json'

class ContactsSDK
  attr_reader :token

  def initialize(email = nil, password = nil)
    @token = nil
    login(email, password) if email && password
  end

  def login(email, password)
    params = { :email => email, :password => password }
    @token = JSON.parse(RestClient.post(get_url("/session"), params))["token"]
  end

  def logout
    url = get_url("/session")
    @token = nil
    JSON.parse(RestClient.delete(url))
  end

  def get(path)
    JSON.parse(RestClient.get(get_url(path)))
  end

  def post(path, params = {})
    JSON.parse(RestClient.post(get_url(path), params))
  end

  def put(path, params = {})
    JSON.parse(RestClient.put(get_url(path), params))
  end

  def delete(path, params = {})
    JSON.parse(RestClient.delete(get_url(path, params)))
  end

  private
    def get_url(path, query_values = {})
      query_values[:token] = token if token
      Addressable::URI.new(
        scheme: "http",
        host: "localhost",
        port: 3000,
        path: path,
        query_values: query_values
      ).to_s
    end
end