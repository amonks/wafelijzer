# partial_helper.rb 
module Wafelijzer
  class App
    module PartialHelper
    	def databasePartial title
    		Kramdown::Document.new(Text.where(:title => title).first.body).to_html
    	end
    	def settingValue title
			setting = Setting.where(:title => title).first
            if setting
                return setting.body
            else
                return false
            end
    	end
    end

    helpers PartialHelper
	end
end
