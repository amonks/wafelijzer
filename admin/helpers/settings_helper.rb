# partial_helper.rb 
module Wafelijzer
  class Admin
    module PartialHelper
        def settingValue title
            setting = Setting.where(:title => title).first
            if setting && setting.body
                return setting.body
            else
                return false
            end
        end
    end

    helpers PartialHelper
    end
end
