Sequel.migration do
  up do
    create_table :albums_artists do
      foreign_key :album_id, :albums
      foreign_key :artist_id, :artists

      String :role
    end
    create_table :artists_videos do
      foreign_key :artist_id, :artists
      foreign_key :video_id, :videos

      String :role
    end
  	create_join_table(:album_id=>:albums, :video_id=>:videos)
  end

  down do
    drop_table :albums_artists
    drop_table :artists_videos
    drop_table :albums_videos
  end
end
