module Webhookr
  module Shopkeep
    module Generators

      class ExampleHooksGenerator < Rails::Generators::Base
        source_root File.expand_path(File.join(File.dirname(__FILE__), 'templates'))

        desc "Creates an example Shopkeep hook file: 'app/models/shop_keep_hooks.rb'"
        def example_hooks
          copy_file( "shop_keep_hooks.rb", "app/models/shop_keep_hooks.rb")
        end
      end

    end
  end
end
