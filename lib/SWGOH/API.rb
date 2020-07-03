require 'SWGOH/API/version'
require 'http'
require 'json'


module SWGOH
  module API
    class Error < StandardError; end

    module PATH
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

    @access_token

    def self.auth(username, password)
      response = HTTP.post(@base_path + PATH::AUTH_SIGNIN, form: {
          username: username,
          password: password,
          grant_type: 'password',
          client_id: 123,
          client_secret: 'abc',
      })
      json_response = JSON.parse(response)
      @access_token = json_response["access_token"]
    end

    def self.get_players(ally_codes)
      return request(PATH::PLAYER, ally_codes)
    end

    def self.get_guilds(ally_codes)
      return request(PATH::GUILD, ally_codes)
    end

    def self.get_rosters(ally_codes)
      return request(PATH::ROSTER, ally_codes)
    end

    def self.get_units(ally_codes)
      return request(PATH::UNITS, ally_codes)
    end

    def self.get_zetas(ally_codes)
      return request(PATH::ZETAS, ally_codes)
    end

    def self.get_squads(ally_codes)
      return request(PATH::SQUADS, ally_codes)
    end

    def self.get_events(ally_codes)
      return request(PATH::EVENTS, ally_codes)
    end

    def self.get_battles(ally_codes)
      return request(PATH::BATTLES, ally_codes)
    end

    private

    def self.request(path, ally_codes)
      response = HTTP.auth("Bearer " + @access_token)
                     .post(@base_path + path, form: {
                         allycodes: ally_codes,
                     })
      return JSON.parse(response)
    end

  end
end
