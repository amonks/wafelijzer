# # This is our assets controller
#
# We'll use this file to handle routing for theme CSS files.

Wafelijzer::App.controllers :artist do

  # This route is for the artists index at `/artists`
  get :css, :cache => true, :map => '/assets/theme.css' do
    content_type 'text/css'
    theme_raw_css(setting_value('theme'))
  end

end
