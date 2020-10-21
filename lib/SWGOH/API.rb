# frozen_string_literal: true

module SWGOH
  # The API module supports the client
  module API
    class Error < StandardError; end

    module PATH
      BASE = 'api.swgoh.help'
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

    module COLLECTION
      ABILITY = 'abilityList'
      BATTLE_ENVIRONMENT = 'battleEnvironmentsList'
      BATTLE_TARGETING_RULE = 'battleTargetingRuleList'
      CATEGORY = 'categoryList'
      CHALLENGE = 'challengeList'
      CHALLENGE_STYLE = 'challengeStyleList'
      EFFECT = 'effectList'
      ENVIRONMENT_COLLECTION = 'environmentCollectionList'
      EQUIPMENT = 'equipmentList'
      EVENT_SAMPLING = 'eventSamplingList'
      GUILD_EXCHANGE_ITEM = 'guildExchangeItemList'
      GUILD_RAID = 'guildRaidList'
      HELP_ENTRY = 'helpEntryList'
      MATERIAL = 'materialList'
      PLAYER_TITLE = 'playerTitleList'
      POWER_UP_BUNDLE = 'powerUpBundleList'
      RAID_CONFIG = 'raidConfigList'
      RECIPE = 'recipeList'
      REQUIREMENT = 'requirementList'
      SKILL = 'skillList'
      STARTER_GUILD = 'starterGuildList'
      STAT_MOD = 'statModList'
      STAT_MOD_SET = 'statModSetList'
      STAT_PROGRESSION_LIST = 'statProgressionList'
      TABLE = 'tableList'
      TARGETING_SET = 'targetingSetList'
      TERRITORY_BATTLE_DEFINITION = 'territoryBattleDefinitionList'
      TERRITORY_WAR_DEFINITION = 'territoryWarDefinitionList'
      UNIT = 'unitsList'
      UNLOCK_ANNOUNCEMENT_DEFINITION = 'unlockAnnouncementDefinitionList'
      WAR_DEFINITION = 'warDefinitionList'
      XP_TABLE = 'xpTableList'
    end
  end
end
