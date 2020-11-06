# frozen_string_literal: true

require 'json'
require 'net/http'
require 'SWGOH/API'
require 'SWGOH/API/CLIENT/LOG/log'
require 'uri'

# Makes requests for the client
class REQUESTER
  attr_accessor :log

  def initialize
    @log = LOG.new
  end

  # @param [String]  username
  # @param [String] password
  # @return [JSON || nil]
  def auth_request(username, password)
    response = Net::HTTP.post_form(uri(SWGOH::API::PATH::AUTH_SIGNIN), auth_request_form(username, password))
    return @log.error(response) unless response.is_a?(Net::HTTPSuccess)

    JSON.parse(response.body)
  end

  # @param [String] access_token
  # @param [PATH] path
  # @param [Hash] data
  # @return [JSON || nil]
  def request(access_token, path, data)
    response = Net::HTTP.post(uri(path), default_data.merge(data).to_json, request_headers(access_token))
    return @log.error(response) unless response.is_a?(Net::HTTPSuccess)

    JSON.parse(response.body)
  end

  private

  # @return [Module<URI>]
  def uri(path)
    URI("https://#{SWGOH::API::PATH::BASE}/#{path}")
  end

  # @param [String]  username
  # @param [String] password
  # @return [Hash]
  def auth_request_form(username, password)
    {
      username: username,
      password: password,
      grant_type: 'password',
      client_id: 123,
      client_secret: 'abc'
    }
  end

  # @return [Hash]
  def request_headers(access_token)
    {
      Authorization: 'Bearer ' + access_token,
      'Content-Type': 'application/json;charset=utf-8'
    }
  end

  # @return [Hash]
  def default_data
    {
      language: SWGOH::API::LANGUAGE::ENG_US,
      enums: false,
      structure: false
    }
  end
end
