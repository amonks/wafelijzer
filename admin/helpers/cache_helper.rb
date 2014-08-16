module Wafelijzer
  class Admin
    module CacheHelper
      def flush_cache
        if Padrino.env == :production # || Padrino.env == :development
          Wafelijzer::Admin.cache.flush
        end
      end
    end

    helpers CacheHelper
    end
end
