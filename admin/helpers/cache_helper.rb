module Wafelijzer
  class Admin
    module CacheHelper
      def flush_cache
        if cache_is_on
          Wafelijzer::App.cache.flush
        end
      end
    end

    helpers CacheHelper
    end
end
