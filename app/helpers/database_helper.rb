# # This is our helper for the pulling config stuff out of the database.
# 
# This file is for useful methods related to getting database config values and for rendering in general.
# Helper methods defined here can be accessed in any controller or view in the application
module Wafelijzer

  class App
  module DatabaseHelper

    # This method is for getting a Text from the database and rendering it from Markdown.
    def database_partial title

      # query the database
      text = Text.where(:title => title).first

      # if the Text exists and is populated, render it
      if text && text.body
        require 'kramdown'
        return Kramdown::Document.new(text.body).to_html

      # otherwise return false
      else
        return false
      end
    end

    # This method is for getting a setting value from the database.
    def setting_value title

      # Query the database
      setting = Setting.where(:title => title).first

      # If the setting exists and is populated, render it
      if setting && setting.body
        return setting.body

      # Otherwise return false
      else
        return false
      end
    end

    # This is a wrapper function for checking which theme is set and getting its CSS `<style>` tag.
    def theme_css
      # first check which theme is being used
      themeObject = Setting.where(:title => "theme").first

      # if a theme is set, call `theme_css_tag` on the theme name.
      if themeObject && themeObject.body
        if theme_tag = theme_css_tag(themeObject.body)
          return theme_tag
        else
          return ""
        end

      # otherwise return an empty string
      else
        return ""
      end
    end

    # This is a function for getting the `<style>` tag associated with a given theme.
    def theme_css_tag title
      theme = Theme.where(:title => title).first
      if theme && theme.css
        tag = "<style>" + theme.css + "</style>"
        return tag
      else
        return false
      end
    end

    # This is a wrapper function for checking which theme is set and getting its JS `<script>` tag.
    def theme_js

      # First check which theme is being used
      themeObject = Setting.where(:title => "theme").first

      # if a theme is set, call `theme_js_tag` on its name.
      if themeObject && themeObject.body
        if theme_tag = theme_js_tag(themeObject.body)
          return theme_tag
        else
          return ""
        end

      # if no theme is set, return an empty theme.
      else
        return ""
      end
    end

    # This is a function for getting the `<script>` tag associated with a given theme.
    def theme_js_tag title
      theme = Theme.where(:title => title).first
      if theme && theme.js
        tag = "<script type='text/javascript'>" + theme.js + "</script>"
        return tag
      else
        return false
      end
    end
    
    # This is a method for returning the typekit kit embed tag, if a typekit id is specified in the settings.
    def typekit_tag

      # first check the settings for a typekit ID
      typekit = Setting.where(:title => "typekit").first

      # if there is one, render the tag.
      if typekit && typekit.body
        tag = '<script type="text/javascript" src="//use.typekit.net/' + typekit.body + '.js"></script><script type="text/javascript">try{Typekit.load();}catch(e){}</script>'
        return tag

      # otherwise return an empty string.
      else
        return ''
      end
    end
  end

  helpers DatabaseHelper
  end
end
