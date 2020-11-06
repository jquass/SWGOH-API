# frozen_string_literal: true

require 'net/http'

# A Logging utility class
class LOG
  # @param [Net::HTTPResponse] response
  def error(response)
    puts response.body if response.is_a?(Net::HTTPResponse)
  end
end
