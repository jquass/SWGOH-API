# frozen_string_literal: true

require 'SWGOH/API'
require 'SWGOH/API/CLIENT/requester'

# The CLIENT class makes requests to api.swgoh.api
class CLIENT
  attr_writer :access_token, :requester

  def initialize
    @access_token = nil
    @requester = REQUESTER.new
  end

  # @return [Boolean]
  def authorized?
    !@access_token.nil?
  end

  # @param [String] username
  # @param [String] password
  # @return [String | nil]
  def authorize(username, password)
    response = @requester.auth_request(username, password)
    @access_token = response['access_token'] unless response.nil?
  end

  # @param [Array] ally_codes
  # @param [Hash] params
  # @return [JSON || nil]
  def players(ally_codes, params = {})
    ally_codes_request(SWGOH::API::PATH::PLAYER, ally_codes, params)
  end

  # @param [Array] ally_codes
  # @param [Hash] params
  # @return [JSON || nil]
  def guilds(ally_codes, params = {})
    ally_codes_request(SWGOH::API::PATH::GUILD, ally_codes, params)
  end

  # @param [Array] ally_codes
  # @param [Hash] params
  # @return [JSON || nil]
  def rosters(ally_codes, params = {})
    ally_codes_request(SWGOH::API::PATH::ROSTER, ally_codes, params)
  end

  # @param [Array] ally_codes
  # @param [Hash] params
  # @return [JSON || nil]
  def units(ally_codes, params = {})
    ally_codes_request(SWGOH::API::PATH::UNITS, ally_codes, params)
  end

  # @param [Hash] params
  # @return [JSON || nil]
  def zetas(params = {})
    request(SWGOH::API::PATH::ZETAS, params)
  end

  # @param [Hash] params
  # @return [JSON || nil]
  def squads(params = {})
    request(SWGOH::API::PATH::SQUADS, params)
  end

  # @param [Hash] params
  # @return [JSON || nil]
  def events(params = {})
    request(SWGOH::API::PATH::EVENTS, params)
  end

  # @param [Hash] params
  # @return [JSON || nil]
  def battles(params = {})
    request(SWGOH::API::PATH::BATTLES, params)
  end

  # @param [Hash] params
  # @return [JSON || nil]
  def abilities(params = {})
    data_collection_request(SWGOH::API::COLLECTION::ABILITY, params)
  end

  # @param [Hash] params
  # @return [JSON || nil]
  def battle_environments(params = {})
    data_collection_request(SWGOH::API::COLLECTION::BATTLE_ENVIRONMENT, params)
  end

  # @param [Hash] params
  # @return [JSON || nil]
  def battle_targeting_rules(params = {})
    data_collection_request(SWGOH::API::COLLECTION::BATTLE_TARGETING_RULE, params)
  end

  # @param [Hash] params
  # @return [JSON || nil]
  def categories(params = {})
    data_collection_request(SWGOH::API::COLLECTION::CATEGORY, params)
  end

  # @param [Hash] params
  # @return [JSON || nil]
  def challenges(params = {})
    data_collection_request(SWGOH::API::COLLECTION::CHALLENGE, params)
  end

  # @param [Hash] params
  # @return [JSON || nil]
  def challenge_styles(params = {})
    data_collection_request(SWGOH::API::COLLECTION::CHALLENGE_STYLE, params)
  end

  # @param [Hash] params
  # @return [JSON || nil]
  def effects(params = {})
    data_collection_request(SWGOH::API::COLLECTION::EFFECT, params)
  end

  # @param [Hash] params
  # @return [JSON || nil]
  def environment_collections(params = {})
    data_collection_request(SWGOH::API::COLLECTION::ENVIRONMENT_COLLECTION, params)
  end

  # @param [Hash] params
  # @return [JSON || nil]
  def equipment(params = {})
    data_collection_request(SWGOH::API::COLLECTION::EQUIPMENT, params)
  end

  # @param [Hash] params
  # @return [JSON || nil]
  def event_samples(params = {})
    data_collection_request(SWGOH::API::COLLECTION::EVENT_SAMPLING, params)
  end

  # @param [Hash] params
  # @return [JSON || nil]
  def guild_exchange_items(params = {})
    data_collection_request(SWGOH::API::COLLECTION::GUILD_EXCHANGE_ITEM, params)
  end

  # @param [Hash] params
  # @return [JSON || nil]
  def guild_raids(params = {})
    data_collection_request(SWGOH::API::COLLECTION::GUILD_RAID, params)
  end

  # @param [Hash] params
  # @return [JSON || nil]
  def help_entries(params = {})
    data_collection_request(SWGOH::API::COLLECTION::HELP_ENTRY, params)
  end

  # @param [Hash] params
  # @return [JSON || nil]
  def materials(params = {})
    data_collection_request(SWGOH::API::COLLECTION::MATERIAL, params)
  end

  # @param [Hash] params
  # @return [JSON || nil]
  def player_titles(params = {})
    data_collection_request(SWGOH::API::COLLECTION::PLAYER_TITLE, params)
  end

  # @param [Hash] params
  # @return [JSON || nil]
  def power_up_bundles(params = {})
    data_collection_request(SWGOH::API::COLLECTION::POWER_UP_BUNDLE, params)
  end

  # @param [Hash] params
  # @return [JSON || nil]
  def raid_configs(params = {})
    data_collection_request(SWGOH::API::COLLECTION::RAID_CONFIG, params)
  end

  # @param [Hash] params
  # @return [JSON || nil]
  def recipes(params = {})
    data_collection_request(SWGOH::API::COLLECTION::RECIPE, params)
  end

  # @param [Hash] params
  # @return [JSON || nil]
  def requirements(params = {})
    data_collection_request(SWGOH::API::COLLECTION::REQUIREMENT, params)
  end

  # @param [Hash] params
  # @return [JSON || nil]
  def skills(params = {})
    data_collection_request(SWGOH::API::COLLECTION::SKILL, params)
  end

  # @param [Hash] params
  # @return [JSON || nil]
  def starter_guilds(params = {})
    data_collection_request(SWGOH::API::COLLECTION::STARTER_GUILD, params)
  end

  # @param [Hash] params
  # @return [JSON || nil]
  def stat_mods(params = {})
    data_collection_request(SWGOH::API::COLLECTION::STAT_MOD, params)
  end

  # @param [Hash] params
  # @return [JSON || nil]
  def stat_mod_sets(params = {})
    data_collection_request(SWGOH::API::COLLECTION::STAT_MOD_SET, params)
  end

  # @param [Hash] params
  # @return [JSON || nil]
  def stat_progressions(params = {})
    data_collection_request(SWGOH::API::COLLECTION::STAT_PROGRESSION, params)
  end

  # @param [Hash] params
  # @return [JSON || nil]
  def tables(params = {})
    data_collection_request(SWGOH::API::COLLECTION::TABLE, params)
  end

  # @param [Hash] params
  # @return [JSON || nil]
  def targeting_sets(params = {})
    data_collection_request(SWGOH::API::COLLECTION::TARGETING_SET, params)
  end

  # @param [Hash] params
  # @return [JSON || nil]
  def territory_battle_definitions(params = {})
    data_collection_request(SWGOH::API::COLLECTION::TERRITORY_BATTLE_DEFINITION, params)
  end

  # @param [Hash] params
  # @return [JSON || nil]
  def territory_war_definitions(params = {})
    data_collection_request(SWGOH::API::COLLECTION::TERRITORY_WAR_DEFINITION, params)
  end

  # @param [Hash] params
  # @return [JSON || nil]
  def units_list(params = {})
    data_collection_request(SWGOH::API::COLLECTION::UNIT, params)
  end

  # @param [Hash] params
  # @return [JSON || nil]
  def unlock_announcement_defs(params = {})
    data_collection_request(SWGOH::API::COLLECTION::UNLOCK_ANNOUNCEMENT_DEFINITION, params)
  end

  # @param [Hash] params
  # @return [JSON || nil]
  def war_definitions(params = {})
    data_collection_request(SWGOH::API::COLLECTION::WAR_DEFINITION, params)
  end

  # @param [Hash] params
  # @return [JSON || nil]
  def xp_tables(params = {})
    data_collection_request(SWGOH::API::COLLECTION::XP_TABLE, params)
  end

  private

  attr_reader :access_token, :requester

  # @param [PATH] path
  # @param [Hash] params
  # @return [JSON || nil]
  def request(path, params = {})
    return unless authorized?

    @requester.request(@access_token, path, params)
  end

  # @param [PATH] path
  # @param [Array] ally_codes
  # @param [Hash] params
  # @return [JSON || nil]
  def ally_codes_request(path, ally_codes, params = {})
    request(path, params.merge({ allyCodes: ally_codes }))
  end

  # @param [SWGOH::API::PATH::COLLECTION] collection
  # @param [Hash] params
  # @return [JSON || nil]
  def data_collection_request(collection, params = {})
    request(SWGOH::API::PATH::DATA, params.merge({ collection: collection }))
  end
end
