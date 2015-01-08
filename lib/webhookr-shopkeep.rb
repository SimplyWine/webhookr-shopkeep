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
        Array.wrap(raw_response).collect do |p|
          Webhookr::AdapterResponse.new(
            SERVICE_NAME,
            EVENT_KEY,
            OstructUtils.to_ostruct(p)
          )
        end
      end

    end

  end
end
