# database_helper.rb 
module Wafelijzer
  class Admin
  module DatabaseHelper
    def setting_value title
      setting = Setting.where(:title => title).first
      if setting && setting.body
        return setting.body
      else
        return false
      end
    end
  end

  helpers DatabaseHelper
  end
end
  