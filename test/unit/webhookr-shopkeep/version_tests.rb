$: << File.join(File.dirname(__FILE__), %w{ .. .. })
require 'test_helper'

describe Webhookr::Shopkeep do
  it "must be defined" do
    Webhookr::Shopkeep::VERSION.wont_be_nil
  end
end