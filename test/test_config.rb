RACK_ENV = 'test' unless defined?(RACK_ENV)
require File.expand_path('../../config/boot', __FILE__)
require 'minitest/pride'
Dir[File.expand_path(File.dirname(__FILE__) + "/../app/helpers/**/*.rb")].each(&method(:require))

class MiniTest::Spec
  include Capybara::DSL
  Capybara.app = Padrino.application

  Sequel.extension :migration
  Sequel::Migrator.run(Sequel.connect("jdbc:postgresql://localhost/wafelijzer_test", :loggers => [logger]), "db/migrate", target: 0)
  Sequel::Migrator.run(Sequel.connect("jdbc:postgresql://localhost/wafelijzer_test", :loggers => [logger]), "db/migrate")

  # You can use this method to custom specify a Rack app
  # you want rack-test to invoke:
  #
  #   app Wafelijzer::App
  #   app Wafelijzer::App.tap { |a| }
  #   app(Wafelijzer::App) do
  #   set :foo, :bar
  #   end
  #
  def app(app = nil, &blk)
    @app ||= block_given? ? app.instance_eval(&blk) : app
    @app ||= Padrino.application
  end

  def login
    visit '/bootstrap'
    visit '/admin/sessions/new'
    within(".login-body") do
      fill_in 'Email', :with => 'admin@example.com'
      fill_in 'Password', :with => 'password'
    end
    click_button 'Sign In'
  end

end
