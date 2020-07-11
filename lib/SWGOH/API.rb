require 'SWGOH/API/version'
require 'http'
require 'json'

module SWGOH
  # Wrapper around api.swgoh.help
  module API
    class Error < StandardError; end

    ally_code_error = SWGOH::API::Error('Parameter ally_codes must be Array')

    module PATH
      # frozen_string_literal: true
      BASE = 'https://api.swgoh.help/'
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

  end
end
