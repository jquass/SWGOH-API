# frozen_string_literal: true

require 'test_helper'
require 'SWGOH/API'
require 'SWGOH/API/CLIENT/client'

class ClientRequestTest < Minitest::Test
  ACCESS_TOKEN = 'access-token'
  ALLY_CODES = ['123456789'].freeze
  RESPONSE_JSON = '[{}]'

  def test_it_gets_players
    mock_request(SWGOH::API::PATH::PLAYER)

    players = authenticated_client.get_players(ALLY_CODES)

    assert_equal JSON.parse(RESPONSE_JSON), players
  end

  def test_it_gets_guilds
    mock_request(SWGOH::API::PATH::GUILD)

    guilds = authenticated_client.get_guilds(ALLY_CODES)

    assert_equal JSON.parse(RESPONSE_JSON), guilds
  end

  def test_it_gets_rosters
    mock_request(SWGOH::API::PATH::ROSTER)

    rosters = authenticated_client.get_rosters(ALLY_CODES)

    assert_equal JSON.parse(RESPONSE_JSON), rosters
  end

  def test_it_gets_units
    mock_request(SWGOH::API::PATH::UNITS)

    units = authenticated_client.get_units(ALLY_CODES)

    assert_equal JSON.parse(RESPONSE_JSON), units
  end

  def test_it_gets_zetas
    mock_request(SWGOH::API::PATH::ZETAS)

    zetas = authenticated_client.get_zetas(ALLY_CODES)

    assert_equal JSON.parse(RESPONSE_JSON), zetas
  end

  def test_it_gets_squads
    mock_request(SWGOH::API::PATH::SQUADS)

    squads = authenticated_client.get_squads(ALLY_CODES)

    assert_equal JSON.parse(RESPONSE_JSON), squads
  end

  def test_it_gets_events
    mock_request(SWGOH::API::PATH::EVENTS)

    events = authenticated_client.get_events(ALLY_CODES)

    assert_equal JSON.parse(RESPONSE_JSON), events
  end

  def test_it_gets_battles
    mock_request(SWGOH::API::PATH::BATTLES)

    battles = authenticated_client.get_battles(ALLY_CODES)

    assert_equal JSON.parse(RESPONSE_JSON), battles
  end

  private

  def mock_request(path)
    WebMock.stub_request(:post, 'https://api.swgoh.help/' + path)
           .with(body: request_body(ALLY_CODES), headers: request_headers)
           .to_return(status: 200, body: RESPONSE_JSON, headers: {})
  end

  def authenticated_client
    client = CLIENT.new
    client.access_token = ACCESS_TOKEN
    client
  end

  def request_body(ally_codes)
    "[{:allyCodes=>#{ally_codes}, :language=>\"ENG_US\", :enums=>false, :structure=>false}]"
  end

  def request_headers
    {
      'Accept' => '*/*',
      'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
      'Authorization' => 'Bearer access-token',
      'User-Agent' => 'Ruby'
    }
  end
end
