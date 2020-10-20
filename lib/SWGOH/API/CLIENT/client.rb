# frozen_string_literal: true

require 'SWGOH/API'
require 'uri'
require 'net/http'
require 'json'

# The CLIENT class makes requests to api.swgoh.api
class CLIENT
  attr_accessor :language, :enums, :structure
  attr_writer :access_token

  def initialize
    @language = SWGOH::API::LANGUAGE::ENG_US
    @enums = false
    @structure = false
    @access_token = nil
  end

  # @return [Boolean]
  def authorized?
    !@access_token.nil?
  end

  # @param [String] username
  # @param [String] password
  # @return [String | nil]
  def authorize(username, password)
    form = auth_request_form(username, password)
    path = "https://#{SWGOH::API::PATH::BASE}/#{SWGOH::API::PATH::AUTH_SIGNIN}"
    res = Net::HTTP.post_form(URI(path), form)
    return log_error(res) unless res.is_a?(Net::HTTPSuccess)

    @access_token = JSON.parse(res.body)['access_token']
  end

  # @param [Array] ally_codes
  # @return [JSON || nil]
  def players(ally_codes)
    ally_codes_request(SWGOH::API::PATH::PLAYER, ally_codes)
  end

  # @param [Array] ally_codes
  # @return [JSON || nil]
  def guilds(ally_codes)
    ally_codes_request(SWGOH::API::PATH::GUILD, ally_codes)
  end

  # @param [Array] ally_codes
  # @return [JSON || nil]
  def rosters(ally_codes)
    ally_codes_request(SWGOH::API::PATH::ROSTER, ally_codes)
  end

  # @param [Array] ally_codes
  # @return [JSON || nil]
  def units(ally_codes)
    ally_codes_request(SWGOH::API::PATH::UNITS, ally_codes)
  end

  # @return [JSON || nil]
  def zetas
    request(SWGOH::API::PATH::ZETAS)
  end

  # @return [JSON || nil]
  def squads
    request(SWGOH::API::PATH::SQUADS)
  end

  # @return [JSON || nil]
  def events
    request(SWGOH::API::PATH::EVENTS)
  end

  # @return [JSON || nil]
  def battles
    request(SWGOH::API::PATH::BATTLES)
  end

  private

  attr_reader :access_token

  # @param [PATH] path
  # @return [JSON || nil]
  def request(path)
    return unless authorized?

    uri = URI("https://#{SWGOH::API::PATH::BASE}/#{path}")
    response = Net::HTTP.post(uri, request_data.to_json, request_headers)
    return log_error(response) unless response.is_a?(Net::HTTPSuccess)

    JSON.parse(response.body)
  end

  # @param [PATH] path
  # @param [Array] ally_codes
  # @return [JSON || nil]
  def ally_codes_request(path, ally_codes)
    return unless authorized?

    uri = URI("https://#{SWGOH::API::PATH::BASE}/#{path}")
    ally_code_request_data = request_data
    ally_code_request_data[:allyCodes] = ally_codes
    response = Net::HTTP.post(uri, ally_code_request_data.to_json, request_headers)
    return log_error(response) unless response.is_a?(Net::HTTPSuccess)

    JSON.parse(response.body)
  end

  # @return [Hash]
  def request_headers
    {
      Authorization: 'Bearer ' + @access_token,
      'Content-Type': 'application/json;charset=utf-8'
    }
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
  def request_data
    {
      language: language,
      enums: enums,
      structure: structure
    }
  end

  def log_error(result)
    puts result.inspect
    puts result.body if result.is_a?(Net::HTTPResponse)
  end
end
