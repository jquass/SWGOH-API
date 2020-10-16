# frozen_string_literal: true

require 'test_helper'
require 'SWGOH/API/CLIENT/client'

class ClientAuthTest < Minitest::Test
  ALLY_CODES = ['123456789'].freeze
  PASSWORD = 'this-is-the-password'
  TOKEN = 'access_token'
  USERNAME = 'this-is-the-username'

  def test_it_starts_unauthorized
    client = CLIENT.new

    assert_equal false, client.authorized?
  end

  def test_it_authorizes
    client = CLIENT.new
    WebMock.stub_request(:post, 'https://api.swgoh.help/auth/signin')
           .with(body: body(USERNAME, PASSWORD), headers: headers)
           .to_return(status: 200, body: "{\"access_token\":\"#{TOKEN}\"}")

    returned_token = client.authorize(USERNAME, PASSWORD)

    assert_equal TOKEN, returned_token
    assert_equal true, client.authorized?
  end

  def test_it_returns_nil_on_error
    client = CLIENT.new
    WebMock.stub_request(:post, 'https://api.swgoh.help/auth/signin')
           .with(body: body(USERNAME, PASSWORD), headers: headers)
           .to_return(status: 500, body: '')

    returned_token = client.authorize(USERNAME, PASSWORD)

    assert_nil returned_token
    assert_equal false, client.authorized?
  end

  def test_it_authorizes_manually
    client = CLIENT.new

    client.access_token = TOKEN

    assert_equal true, client.authorized?
  end

  def test_it_gets_nil_unauthed
    client = CLIENT.new

    players = client.get_players(ALLY_CODES)

    assert_nil players
  end

  private

  def body(username, password)
    {
      'client_id' => '123',
      'client_secret' => 'abc',
      'grant_type' => 'password',
      'password' => password,
      'username' => username
    }
  end

  def headers
    {
      'Accept' => '*/*',
      'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
      'Content-Type' => 'application/x-www-form-urlencoded',
      'Host' => 'api.swgoh.help',
      'User-Agent' => 'Ruby'
    }
  end
end
