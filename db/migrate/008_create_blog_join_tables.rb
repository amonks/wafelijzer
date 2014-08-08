Sequel.migration do
  up do
  	create_join_table(:album_id=>:albums, :blog_id=>:blogs)
  	create_join_table(:artist_id=>:artists, :blog_id=>:blogs)
  	create_join_table(:video_id=>:videos, :blog_id=>:blogs)
  end

  down do
    drop_table :albums_blogs
    drop_table :artists_blogs
    drop_table :blogs_videos
  end
end
