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

  # @return [JSON || nil]
  def abilities
    data_request(SWGOH::API::COLLECTION::ABILITY)
  end

  # @return [JSON || nil]
  def battle_environments
    data_request(SWGOH::API::COLLECTION::BATTLE_ENVIRONMENT)
  end

  # @return [JSON || nil]
  def battle_targeting_rules
    data_request(SWGOH::API::COLLECTION::BATTLE_TARGETING_RULE)
  end

  # @return [JSON || nil]
  def categories
    data_request(SWGOH::API::COLLECTION::CATEGORY)
  end

  # @return [JSON || nil]
  def challenges
    data_request(SWGOH::API::COLLECTION::CHALLENGE)
  end

  # @return [JSON || nil]
  def challenge_styles
    data_request(SWGOH::API::COLLECTION::CHALLENGE_STYLE)
  end

  # @return [JSON || nil]
  def effects
    data_request(SWGOH::API::COLLECTION::EFFECT)
  end

  # @return [JSON || nil]
  def environment_collections
    data_request(SWGOH::API::COLLECTION::ENVIRONMENT_COLLECTION)
  end

  # @return [JSON || nil]
  def equipment
    data_request(SWGOH::API::COLLECTION::EQUIPMENT)
  end

  # @return [JSON || nil]
  def event_samples
    data_request(SWGOH::API::COLLECTION::EVENT_SAMPLING)
  end

  # @return [JSON || nil]
  def guild_exchange_items
    data_request(SWGOH::API::COLLECTION::GUILD_EXCHANGE_ITEM)
  end

  # @return [JSON || nil]
  def guild_raids
    data_request(SWGOH::API::COLLECTION::GUILD_RAID)
  end

  # @return [JSON || nil]
  def help_entries
    data_request(SWGOH::API::COLLECTION::HELP_ENTRY)
  end

  # @return [JSON || nil]
  def materials
    data_request(SWGOH::API::COLLECTION::MATERIAL)
  end

  # @return [JSON || nil]
  def player_titles
    data_request(SWGOH::API::COLLECTION::PLAYER_TITLE)
  end

  # @return [JSON || nil]
  def power_up_bundles
    data_request(SWGOH::API::COLLECTION::POWER_UP_BUNDLE)
  end

  # @return [JSON || nil]
  def raid_configs
    data_request(SWGOH::API::COLLECTION::RAID_CONFIG)
  end

  # @return [JSON || nil]
  def recipes
    data_request(SWGOH::API::COLLECTION::RECIPE)
  end

  # @return [JSON || nil]
  def requirements
    data_request(SWGOH::API::COLLECTION::REQUIREMENT)
  end

  # @return [JSON || nil]
  def skills
    data_request(SWGOH::API::COLLECTION::SKILL)
  end

  # @return [JSON || nil]
  def starter_guilds
    data_request(SWGOH::API::COLLECTION::STARTER_GUILD)
  end

  # @return [JSON || nil]
  def stat_mods
    data_request(SWGOH::API::COLLECTION::STAT_MOD)
  end

  # @return [JSON || nil]
  def stat_mod_sets
    data_request(SWGOH::API::COLLECTION::STAT_MOD_SET)
  end

  # @return [JSON || nil]
  def stat_progressions
    data_request(SWGOH::API::COLLECTION::STAT_PROGRESSION)
  end

  # @return [JSON || nil]
  def tables
    data_request(SWGOH::API::COLLECTION::TABLE)
  end

  # @return [JSON || nil]
  def targeting_sets
    data_request(SWGOH::API::COLLECTION::TARGETING_SET)
  end

  # @return [JSON || nil]
  def territory_battle_definitions
    data_request(SWGOH::API::COLLECTION::TERRITORY_BATTLE_DEFINITION)
  end

  # @return [JSON || nil]
  def territory_war_definitions
    data_request(SWGOH::API::COLLECTION::TERRITORY_WAR_DEFINITION)
  end

  # @return [JSON || nil]
  def units_list
    data_request(SWGOH::API::COLLECTION::UNIT)
  end

  # @return [JSON || nil]
  def unlock_announcement_defs
    data_request(SWGOH::API::COLLECTION::UNLOCK_ANNOUNCEMENT_DEFINITION)
  end

  # @return [JSON || nil]
  def war_definitions
    data_request(SWGOH::API::COLLECTION::WAR_DEFINITION)
  end

  # @return [JSON || nil]
  def xp_tables
    data_request(SWGOH::API::COLLECTION::XP_TABLE)
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
    data = request_data
    data[:allyCodes] = ally_codes
    response = Net::HTTP.post(uri, data.to_json, request_headers)
    return log_error(response) unless response.is_a?(Net::HTTPSuccess)

    JSON.parse(response.body)
  end

  # @param [SWGOH::API::PATH::COLLECTION] collection
  # @return [JSON || nil]
  def data_request(collection)
    return unless authorized?

    uri = URI("https://#{SWGOH::API::PATH::BASE}/#{SWGOH::API::PATH::DATA}")
    data = request_data
    data[:collection] = collection
    response = Net::HTTP.post(uri, data.to_json, request_headers)
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
