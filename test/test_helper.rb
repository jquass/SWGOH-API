# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)

require 'minitest/autorun'
require 'webmock/minitest'

require 'SWGOH/API/CLIENT/client'

module TestHelper
  class HELPER
    public

    def authenticated_client
      client = CLIENT.new
      client.access_token = TOKEN
      client
    end
  end
end
