require File.expand_path(File.dirname(__FILE__) + '/../test_config.rb')

describe "Signing in" do
  before do
    login
  end

  it "Signing in with incorrect credentials" do
    visit '/admin/sessions/new' do
      within(".login-body") do
        fill_in 'Email', :with => 'bob@hope.net'
        fill_in 'Password', :with => 'password'
      end
      click_button 'Sign In'
      assert page.has_content?('wrong')
    end
  end

  it "Signing in with correct credentials" do
    visit '/admin/sessions/new' do
      login
      assert page.has_content?('Merches')
    end
  end
end
