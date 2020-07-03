require 'SWGOH/API/version'
require 'http'
require 'json'

module SWGOH
  # Wrapper around api.swgoh.help
  module API
    class Error < StandardError; end

    def self.auth(username, password)
      response = HTTP.post(@base_path + PATH::AUTH_SIGNIN, form: {
                             username: username,
                             password: password,
                             grant_type: 'password',
                             client_id: 123,
                             client_secret: 'abc'
                           })
      json_response = JSON.parse(response)
      @access_token = json_response['access_token']
      true
    end

    def self.get_players(ally_codes)
      request(PATH::PLAYER, ally_codes)
    end

    def self.get_guilds(ally_codes)
      request(PATH::GUILD, ally_codes)
    end

    def self.get_rosters(ally_codes)
      request(PATH::ROSTER, ally_codes)
    end

    def self.get_units(ally_codes)
      request(PATH::UNITS, ally_codes)
    end

    def self.get_zetas(ally_codes)
      request(PATH::ZETAS, ally_codes)
    end

    def self.get_squads(ally_codes)
      request(PATH::SQUADS, ally_codes)
    end

    def self.get_events(ally_codes)
      request(PATH::EVENTS, ally_codes)
    end

    def self.get_battles(ally_codes)
      request(PATH::BATTLES, ally_codes)
    end

    @access_token = nil

    module PATH
      # frozen_string_literal: true
      AUTH_SIGNIN = 'auth/signin'
      PLAYER = 'swgoh/player'
      GUILD = 'swgoh/guild'
      UNITS = 'swgoh/units'
      ROSTER = 'swgoh/roster'
      DATA = 'swgoh/data'
      ZETAS = 'swgoh/zetas'
      SQUADS = 'swgoh/squads'
      EVENTS = 'swgoh/events'
      BATTLES = 'swgoh/battles'
      REGISTRATION = 'registration'
    end

    @base_path = 'https://api.swgoh.help/'

    def self.request(path, ally_codes)
      raise Error, 'empty access_token' if @access_token.nil?

      response = HTTP.auth('Bearer ' + @access_token)
                     .post(@base_path + path, form: {
                             allyCodes: ally_codes
                           })
      JSON.parse(response)
    end
  end
end
