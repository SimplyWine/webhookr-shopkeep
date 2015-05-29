require "webhookr"
require "webhookr-shopkeep/version"
require "active_support/core_ext/module/attribute_accessors"
require "webhookr/ostruct_utils"

module Webhookr
  module Shopkeep
    class Adapter
      SERVICE_NAME = "shopkeep"
      EVENT_KEY = "event"

      include Webhookr::Services::Adapter::Base

      def self.process(raw_response)
        new.process(raw_response)
      end

      def process(raw_response)
        Array.wrap(parse(raw_response)).collect do |p|
          Webhookr::AdapterResponse.new(
            SERVICE_NAME,
            EVENT_KEY,
            p
          )
        end
      end
      
      private

      def parse(raw_response)
        JSON.parse(raw_response)
      end

    end

  end
end
