require 'SWGOH/API/version'
require 'http'
require 'json'

module SWGOH
  # Wrapper around api.swgoh.help
  module API
    class Error < StandardError; end

    @access_token = nil
    @language = LANGUAGE::ENG_US
    @enums = false
    @structure = false
    @base_path = 'https://api.swgoh.help/'

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

    def self.language(language)
      @language = language
    end

    def self.enums(enums)
      @enums = enums
    end

    def self.structure(structure)
      @structure = structure
    end

    # @return [TrueClass, FalseClass]
    def self.authenticated?
      @access_token.nil?
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

    module LANGUAGE
      # frozen_string_literal: true
      CHS_CN = 'CHS_CN'
      CHT_CN = 'CHT_CN'
      ENG_US = 'ENG_US'
      FRE_FR = 'FRE_FR'
      GER_DE = 'GER_DE'
      IND_ID = 'IND_ID'
      ITA_IT = 'ITA_IT'
      JPN_JP = 'JPN_JP'
      KOR_KR = 'KOR_KR'
      POR_BR = 'POR_BR'
      RUS_RU = 'RUS_RU'
      SPA_XM = 'SPA_XM'
      THA_TH = 'THA_TH'
      TUR_TR = 'TUR_TR'
    end

    def self.request(path, ally_codes)
      raise Error, 'Call auth before making requests' if @access_token.nil?

      response = HTTP.auth('Bearer ' + @access_token)
                     .post(@base_path + path, form: {
                             allyCodes: ally_codes,
                             language: @language,
                             enums: @enums,
                             structure: @structure
                           })
      JSON.parse(response)
    end
  end
end
