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
        def themeCss
            themeObject = Setting.where(:title => "theme").first
            if themeObject
                if theme_tag = themeCssTag(themeObject.body)
                    return theme_tag
                else
                    return ""
                end
            else
                return ""
            end
        end
        def themeCssTag title
            theme = Theme.where(:title => title).first
            if theme && theme.css
                tag = "<style>" + theme.css + "</style>"
                return tag
            else
                return false
            end
        end
        def themeJs
            themeObject = Setting.where(:title => "theme").first
            if themeObject
                if theme_tag = themeJsTag(themeObject.body)
                    return theme_tag
                else
                    return ""
                end
            else
                return ""
            end
        end
        def themeJsTag title
            theme = Theme.where(:title => title).first
            if theme && theme.js
                tag = "<script type='text/javascript'>" + theme.js + "</script>"
                return tag
            else
                return false
            end
        end
    end

    helpers PartialHelper
	end
end
