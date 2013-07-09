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
    url = get_url("/session")
    @token = JSON.parse(RestClient.post(url, params))["token"]
  end

  def logout
    url = get_url("/session", {token: token})
    @token = nil
    JSON.parse(RestClient.delete(url, params))
  end

  def get(path)
    url = get_url(path, {token: token})
    JSON.parse(RestClient.get(url))
  end

  def post(path, params = {})
    url = get_url(path, {token: token})
    JSON.parse(RestClient.post(url, params))
  end

  def put(path, params = {})
    url = get_url(path, {token: token})
    JSON.parse(RestClient.put(url, params))
  end

  def delete(path)
    url = get_url(path, {token: token})
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