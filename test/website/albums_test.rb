require File.expand_path(File.dirname(__FILE__) + '/../test_config.rb')

describe "Albums" do
	it "Populating albums from Bandcamp" do
		visit '/admin/sessions/new'
		within(".login-body") do
			fill_in 'Email', :with => 'admin@example.com'
			fill_in 'Password', :with => 'password'
		end
		click_button 'Sign In'

		visit '/admin/albums/new'
		fill_in 'album_bandcamp_url', :with => 'music.belgianman.com/album/bedroom-classics-vol-1'
		click_button 'Save'
		visit '/albums'
		assert page.has_content? 'Bedroom'
	end
end