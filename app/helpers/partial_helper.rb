# partial_helper.rb 
module Wafelijzer
  class App
    module PartialHelper
    	def databasePartial title
            text = Text.where(:title => title).first.body
            if text
        		return Kramdown::Document.new(text).to_html
            else
                return false
            end
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
