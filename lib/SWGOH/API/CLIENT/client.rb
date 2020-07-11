# frozen_string_literal: tru

require 'SWGOH/API'

# The CLIENT class makes requests to api.swgoh.api
class CLIENT
  attr_accessor :language, :enums, :structure
  attr_writer :access_token

  def initialize
    @language = ::LANGUAGE::ENG_US
    @enums = false
    @structure = false
    @access_token = nil
  end

  # @return [Boolean]
  def authorized?
    @access_token.nil?
  end

  # @param [String] username
  # @param [String] password
  # @return [String]
  def authorize(username, password)
    throw ::Error unless password.is_a?(String) && username.is_a?(String)

    response = HTTP.post(::PATH::BASE + ::PATH::AUTH_SIGNIN,
                         form: {
                           username: username,
                           password: password,
                           grant_type: 'password',
                           client_id: 123,
                           client_secret: 'abc'
                         })
    this.access_token = JSON.parse(response)['access_token']
  end

  # @param [Array] ally_codes
  # @return [JSON || nil]
  def get_players(ally_codes)
    request(::PATH::PLAYER, ally_codes)
  end

  # @param [Array] ally_codes
  # @return [JSON || nil]
  def get_guilds(ally_codes)
    request(::PATH::GUILD, ally_codes)
  end

  # @param [Array] ally_codes
  # @return [JSON || nil]
  def get_rosters(ally_codes)
    request(::PATH::ROSTER, ally_codes)
  end

  # @param [Array] ally_codes
  # @return [JSON || nil]
  def get_units(ally_codes)
    request(::PATH::UNITS, ally_codes)
  end

  # @param [Array] ally_codes
  # @return [JSON || nil]
  def get_zetas(ally_codes)
    request(::PATH::ZETAS, ally_codes)
  end

  # @param [Array] ally_codes
  # @return [JSON || nil]
  def get_squads(ally_codes)
    request(::PATH::SQUADS, ally_codes)
  end

  # @param [Array] ally_codes
  # @return [JSON || nil]
  def get_events(ally_codes)
    request(::PATH::EVENTS, ally_codes)
  end

  # @param [Array] ally_codes
  # @return [JSON || nil]
  def get_battles(ally_codes)
    request(::PATH::BATTLES, ally_codes)
  end

  private

  attr_reader :access_token

  # @param [PATH] path
  # @param [Array] ally_codes
  # @return [JSON || nil]
  def request(path, ally_codes)
    throw ::Error unless authorized? && ally_codes.is_a?(Array)

    response = HTTP.auth('Bearer ' + access_token)
                   .post(::PATH::BASE + path,
                         form: {
                           allyCodes: ally_codes,
                           language: language,
                           enums: enums,
                           structure: structure
                         })
    JSON.parse(response)
  end

end
