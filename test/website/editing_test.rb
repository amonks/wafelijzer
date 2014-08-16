require File.expand_path(File.dirname(__FILE__) + '/../test_config.rb')


describe "Editing" do
  before do
    login
  end

  it "should be possible to create an artist" do

    visit "/admin/artists/new"
    within(".tabs-content") do
      fill_in 'artist_name', :with => "Bob HAMWOW!"
      fill_in 'artist_slug', :with => "bob"
      fill_in 'artist_real_name', :with => "Robert Hamilton"
      fill_in 'artist_soundcloud', :with => "leaftype"
      fill_in 'artist_bio', :with => "[bob's website](http://leaftype.tumblr.com/)"
      fill_in 'image', :with => "http://i.imgur.com/TUvQfGd.png"
    end
    click_button 'Save'

    visit '/leaftype'
    assert page.has_content? 'HAMWOW!'
    assert page.has_content? 'Robert Hamilton'
    # assert find_link("bob's website").visible?
  end

  it "should be possible to add an album" do
    visit '/admin/albums/new'
    within(".tabs-content") do
      fill_in 'album_bandcamp_url', :with => 'http://music.belgianman.com/album/bedroom-classics-vol-1'
      fill_in 'artists[1]', :with => 'Rapper'
      check 'artistsEnabled[1]'
    end
    click_button 'Save'

    visit '/albums'
    assert page.has_content? 'Bedroom'
    assert page.has_content? 'LEAFTYPE: Rapper'
  end
end
