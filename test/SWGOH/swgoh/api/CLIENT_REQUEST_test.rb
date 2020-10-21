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

  private

  def mock_request(path)
    WebMock.stub_request(:post, 'https://api.swgoh.help/' + path)
           .with(body: request_body, headers: request_headers)
           .to_return(status: 200, body: RESPONSE_JSON, headers: {})
  end

  def mock_ally_code_request(path)
    ally_code_request_data = request_body
    ally_code_request_data[:allyCodes] = ALLY_CODES
    WebMock.stub_request(:post, 'https://api.swgoh.help/' + path)
           .with(body: ally_code_request_data, headers: request_headers)
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
