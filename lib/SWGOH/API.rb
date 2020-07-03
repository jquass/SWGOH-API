require 'SWGOH/API/version'
require 'http'
require 'json'


module SWGOH
  module API
    class Error < StandardError; end

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

    def self.get_data(collection, match)
      return request_data(collection, match)
    end

    module COLLECTION
      ABILITY_LIST = 'abilityList'
      BATTLE_ENVIRONMENTS_LIST = 'battleEnvironmentsList'
      BATTLE_TARGETING_RUL_LIST = 'battleTargetingRuleList'
      CATEGORY_LIST = 'categoryList'
      CHANNELENGE_LIST = 'challengeList'
      CHANNELGE_STYLE_LIST = 'challengeStyleList'
      # effectList
      # environmentCollectionList
      # equipmentList
      # eventSamplingList
      # guildExchangeItemList
      # guildRaidList
      # helpEntryList
      # materialList
      # playerTitleList
      # powerUpBundleList
      # raidConfigList
      # recipeList
      # requirementList
      # skillList
      # starterGuildList
      # statModList
      # statModSetList
      # statProgressionList
      # tableList
      # targetingSetList
      # territoryBattleDefinitionList
      # territoryWarDefinitionList
      # unitsList
      # unlockAnnouncementDefinitionList
      # warDefinitionList
      # xpTableList
    end

    private

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
      DATA = 'swgoh/data'
    end

    @base_path = 'https://api.swgoh.help/'

    @access_token = nil

    def self.request(path, ally_codes)
      raise Error, 'empty access_token' if @access_token == nil
      response = HTTP.auth("Bearer " + @access_token)
                     .post(@base_path + path, form: {
                         allycodes: ally_codes,
                     })
      return JSON.parse(response)
    end

    def self.request_data(collection, match)
      raise Error, 'empty access_token' if @access_token == nil
      response = HTTP.auth("Bearer " + @access_token)
                     .post(@base_path + PATH::DATA, form: {
                         allycodes: ally_codes,
                     })
      return JSON.parse(response)
    end

  end
end
