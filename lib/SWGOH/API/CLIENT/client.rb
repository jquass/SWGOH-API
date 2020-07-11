# frozen_string_literal: true

# Top level documentation
class CLIENT
  attr_accessor :language, :enums, :structure
  attr_writer :access_token

  def initialize(
    language = LANGUAGE::ENG_US,
    enums = false,
    structure = false
  )
    @language = language
    @enums = enums
    @structure = structure
    @access_token = nil
  end

  def auth(username, password)
    response = HTTP.post(SWGOH::API::PATH::BASE + SWGOH::API::PATH::AUTH_SIGNIN,
                         form: {
                           username: username,
                           password: password,
                           grant_type: 'password',
                           client_id: 123,
                           client_secret: 'abc'
                         })
    json_response = JSON.parse(response)
    @access_token = json_response['access_token']
  end

  def get_players(ally_codes)
    request(SWGOH::API::PATH::PLAYER, ally_codes)
  end

  def get_guilds(ally_codes)
    request(SWGOH::API::PATH::GUILD, ally_codes)
  end

  def get_rosters(ally_codes)
    request(SWGOH::API::PATH::ROSTER, ally_codes)
  end

  def get_units(ally_codes)
    request(SWGOH::API::PATH::UNITS, ally_codes)
  end

  def get_zetas(ally_codes)
    request(SWGOH::API::PATH::ZETAS, ally_codes)
  end

  def get_squads(ally_codes)
    request(SWGOH::API::PATH::SQUADS, ally_codes)
  end

  def get_events(ally_codes)
    request(SWGOH::API::PATH::EVENTS, ally_codes)
  end

  def get_battles(ally_codes)
    request(SWGOH::API::PATH::BATTLES, ally_codes)
  end

  private

  attr_reader :username, :password, :access_token

  # @param [PATH] path
  # @param [Array] ally_codes
  # @return [JSON || nil]
  def request(path, ally_codes)
    return unless @access_token.nil? || !ally_codes.is_a?(Array)

    response = HTTP.auth('Bearer ' + @access_token)
                   .post(SWGOH::API::PATH::BASE + path,
                         form: {
                           allyCodes: ally_codes,
                           language: language,
                           enums: enums,
                           structure: structure
                         })
    JSON.parse(response)
  end
end
