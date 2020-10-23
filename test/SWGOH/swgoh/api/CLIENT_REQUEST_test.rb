# frozen_string_literal: true

require 'test_helper'
require 'SWGOH/API'
require 'SWGOH/API/CLIENT/client'

class ClientRequestTest < Minitest::Test
  ACCESS_TOKEN = 'access-token'
  ALLY_CODES = [123_456_789].freeze
  RESPONSE_JSON = '[{}]'

  def test_it_gets_players
    mock_ally_code_request(SWGOH::API::PATH::PLAYER)

    players = authenticated_client.players(ALLY_CODES)

    assert_equal JSON.parse(RESPONSE_JSON), players
  end

  def test_it_gets_guilds
    mock_ally_code_request(SWGOH::API::PATH::GUILD)

    guilds = authenticated_client.guilds(ALLY_CODES)

    assert_equal JSON.parse(RESPONSE_JSON), guilds
  end

  def test_it_gets_rosters
    mock_ally_code_request(SWGOH::API::PATH::ROSTER)

    rosters = authenticated_client.rosters(ALLY_CODES)

    assert_equal JSON.parse(RESPONSE_JSON), rosters
  end

  def test_it_gets_units
    mock_ally_code_request(SWGOH::API::PATH::UNITS)

    units = authenticated_client.units(ALLY_CODES)

    assert_equal JSON.parse(RESPONSE_JSON), units
  end

  def test_it_gets_zetas
    mock_request(SWGOH::API::PATH::ZETAS)

    zetas = authenticated_client.zetas

    assert_equal JSON.parse(RESPONSE_JSON), zetas
  end

  def test_it_gets_squads
    mock_request(SWGOH::API::PATH::SQUADS)

    squads = authenticated_client.squads

    assert_equal JSON.parse(RESPONSE_JSON), squads
  end

  def test_it_gets_events
    mock_request(SWGOH::API::PATH::EVENTS)

    events = authenticated_client.events

    assert_equal JSON.parse(RESPONSE_JSON), events
  end

  def test_it_gets_battles
    mock_request(SWGOH::API::PATH::BATTLES)

    battles = authenticated_client.battles

    assert_equal JSON.parse(RESPONSE_JSON), battles
  end

  def test_it_gets_abilities
    mock_data_request(SWGOH::API::COLLECTION::ABILITY)

    abilities = authenticated_client.abilities

    assert_equal JSON.parse(RESPONSE_JSON), abilities
  end

  def test_it_gets_battle_environments
    mock_data_request(SWGOH::API::COLLECTION::BATTLE_ENVIRONMENT)

    battle_environments = authenticated_client.battle_environments

    assert_equal JSON.parse(RESPONSE_JSON), battle_environments
  end

  def test_it_gets_battle_targeting_rules
    mock_data_request(SWGOH::API::COLLECTION::BATTLE_TARGETING_RULE)

    battle_targeting_rules = authenticated_client.battle_targeting_rules

    assert_equal JSON.parse(RESPONSE_JSON), battle_targeting_rules
  end

  def test_it_gets_categories
    mock_data_request(SWGOH::API::COLLECTION::CATEGORY)

    categories = authenticated_client.categories

    assert_equal JSON.parse(RESPONSE_JSON), categories
  end

  def test_it_gets_challenges
    mock_data_request(SWGOH::API::COLLECTION::CHALLENGE)

    challenges = authenticated_client.challenges

    assert_equal JSON.parse(RESPONSE_JSON), challenges
  end

  def test_it_gets_challenge_styles
    mock_data_request(SWGOH::API::COLLECTION::CHALLENGE_STYLE)

    challenge_styles = authenticated_client.challenge_styles

    assert_equal JSON.parse(RESPONSE_JSON), challenge_styles
  end

  def test_it_gets_effects
    mock_data_request(SWGOH::API::COLLECTION::EFFECT)

    effects = authenticated_client.effects

    assert_equal JSON.parse(RESPONSE_JSON), effects
  end

  def test_it_gets_environment_collections
    mock_data_request(SWGOH::API::COLLECTION::ENVIRONMENT_COLLECTION)

    environment_collections = authenticated_client.environment_collections

    assert_equal JSON.parse(RESPONSE_JSON), environment_collections
  end

  def test_it_gets_equipment
    mock_data_request(SWGOH::API::COLLECTION::EQUIPMENT)

    equipment = authenticated_client.equipment

    assert_equal JSON.parse(RESPONSE_JSON), equipment
  end

  def test_it_gets_event_samples
    mock_data_request(SWGOH::API::COLLECTION::EVENT_SAMPLING)

    event_samples = authenticated_client.event_samples

    assert_equal JSON.parse(RESPONSE_JSON), event_samples
  end

  def test_it_gets_guild_exchange_items
    mock_data_request(SWGOH::API::COLLECTION::GUILD_EXCHANGE_ITEM)

    guild_exchange_items = authenticated_client.guild_exchange_items

    assert_equal JSON.parse(RESPONSE_JSON), guild_exchange_items
  end

  def test_it_gets_guild_raids
    mock_data_request(SWGOH::API::COLLECTION::GUILD_RAID)

    guild_raids = authenticated_client.guild_raids

    assert_equal JSON.parse(RESPONSE_JSON), guild_raids
  end

  def test_it_gets_help_entries
    mock_data_request(SWGOH::API::COLLECTION::HELP_ENTRY)

    help_entries = authenticated_client.help_entries

    assert_equal JSON.parse(RESPONSE_JSON), help_entries
  end

  def test_it_gets_materials
    mock_data_request(SWGOH::API::COLLECTION::MATERIAL)

    materials = authenticated_client.materials

    assert_equal JSON.parse(RESPONSE_JSON), materials
  end

  def test_it_gets_player_titles
    mock_data_request(SWGOH::API::COLLECTION::PLAYER_TITLE)

    player_titles = authenticated_client.player_titles

    assert_equal JSON.parse(RESPONSE_JSON), player_titles
  end

  def test_it_gets_power_up_bundles
    mock_data_request(SWGOH::API::COLLECTION::POWER_UP_BUNDLE)

    power_up_bundles = authenticated_client.power_up_bundles

    assert_equal JSON.parse(RESPONSE_JSON), power_up_bundles
  end

  def test_it_gets_raid_configs
    mock_data_request(SWGOH::API::COLLECTION::RAID_CONFIG)

    raid_configs = authenticated_client.raid_configs

    assert_equal JSON.parse(RESPONSE_JSON), raid_configs
  end

  def test_it_gets_recipes
    mock_data_request(SWGOH::API::COLLECTION::RECIPE)

    recipes = authenticated_client.recipes

    assert_equal JSON.parse(RESPONSE_JSON), recipes
  end

  def test_it_gets_requirements
    mock_data_request(SWGOH::API::COLLECTION::REQUIREMENT)

    requirements = authenticated_client.requirements

    assert_equal JSON.parse(RESPONSE_JSON), requirements
  end

  def test_it_gets_skills
    mock_data_request(SWGOH::API::COLLECTION::SKILL)

    skills = authenticated_client.skills

    assert_equal JSON.parse(RESPONSE_JSON), skills
  end

  def test_it_gets_starter_guilds
    mock_data_request(SWGOH::API::COLLECTION::STARTER_GUILD)

    starter_guilds = authenticated_client.starter_guilds

    assert_equal JSON.parse(RESPONSE_JSON), starter_guilds
  end

  def test_it_gets_stat_mods
    mock_data_request(SWGOH::API::COLLECTION::STAT_MOD)

    stat_mods = authenticated_client.stat_mods

    assert_equal JSON.parse(RESPONSE_JSON), stat_mods
  end

  def test_it_gets_stat_mod_sets
    mock_data_request(SWGOH::API::COLLECTION::STAT_MOD_SET)

    stat_mod_sets = authenticated_client.stat_mod_sets

    assert_equal JSON.parse(RESPONSE_JSON), stat_mod_sets
  end

  def test_it_gets_stat_progressions
    mock_data_request(SWGOH::API::COLLECTION::STAT_PROGRESSION)

    stat_progressions = authenticated_client.stat_progressions

    assert_equal JSON.parse(RESPONSE_JSON), stat_progressions
  end

  def test_it_gets_tables
    mock_data_request(SWGOH::API::COLLECTION::TABLE)

    tables = authenticated_client.tables

    assert_equal JSON.parse(RESPONSE_JSON), tables
  end

  def test_it_gets_targeting_sets
    mock_data_request(SWGOH::API::COLLECTION::TARGETING_SET)

    targeting_sets = authenticated_client.targeting_sets

    assert_equal JSON.parse(RESPONSE_JSON), targeting_sets
  end

  def test_it_gets_territory_battle_definitions
    mock_data_request(SWGOH::API::COLLECTION::TERRITORY_BATTLE_DEFINITION)

    territory_battle_definitions = authenticated_client.territory_battle_definitions

    assert_equal JSON.parse(RESPONSE_JSON), territory_battle_definitions
  end

  def test_it_gets_territory_war_definitions
    mock_data_request(SWGOH::API::COLLECTION::TERRITORY_WAR_DEFINITION)

    territory_war_definitions = authenticated_client.territory_war_definitions

    assert_equal JSON.parse(RESPONSE_JSON), territory_war_definitions
  end

  def test_it_gets_units_list
    mock_data_request(SWGOH::API::COLLECTION::UNIT)

    units_list = authenticated_client.units_list

    assert_equal JSON.parse(RESPONSE_JSON), units_list
  end

  def test_it_gets_unlock_announcement_defs
    mock_data_request(SWGOH::API::COLLECTION::UNLOCK_ANNOUNCEMENT_DEFINITION)

    unlock_announcement_defs = authenticated_client.unlock_announcement_defs

    assert_equal JSON.parse(RESPONSE_JSON), unlock_announcement_defs
  end

  def test_it_gets_war_definitions
    mock_data_request(SWGOH::API::COLLECTION::WAR_DEFINITION)

    war_definitions = authenticated_client.war_definitions

    assert_equal JSON.parse(RESPONSE_JSON), war_definitions
  end

  def test_it_gets_xp_tables
    mock_data_request(SWGOH::API::COLLECTION::XP_TABLE)

    xp_tables = authenticated_client.xp_tables

    assert_equal JSON.parse(RESPONSE_JSON), xp_tables
  end

  private

  def mock_request(path)
    WebMock.stub_request(:post, 'https://api.swgoh.help/' + path)
           .with(body: request_body.to_json, headers: request_headers)
           .to_return(status: 200, body: RESPONSE_JSON, headers: {})
  end

  def mock_ally_code_request(path)
    body = request_body
    body[:allyCodes] = ALLY_CODES
    WebMock.stub_request(:post, 'https://api.swgoh.help/' + path)
           .with(body: body.to_json, headers: request_headers)
           .to_return(status: 200, body: RESPONSE_JSON, headers: {})
  end

  def mock_data_request(collection)
    body = request_body
    body[:collection] = collection
    WebMock.stub_request(:post, 'https://api.swgoh.help/' + SWGOH::API::PATH::DATA)
           .with(body: body.to_json, headers: request_headers)
           .to_return(status: 200, body: RESPONSE_JSON, headers: {})
  end

  def authenticated_client
    client = CLIENT.new
    client.access_token = ACCESS_TOKEN
    client
  end

  def request_body
    {
      language: 'ENG_US',
      enums: false,
      structure: false
    }
  end

  def request_headers
    {
      'Accept' => '*/*',
      'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
      'Authorization' => 'Bearer access-token',
      'User-Agent' => 'Ruby',
      'Host' => 'api.swgoh.help'
    }
  end
end
