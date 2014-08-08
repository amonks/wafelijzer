Sequel.migration do
  up do
    create_table(:albums_artists) do
      foreign_key :album_id
      foreign_key :artist_id

      String :role # eg "Composer", "Producer", "Remixer", "Cover Artist"
    end
    create_table(:artists_videos) do
      foreign_key :artist_id
      foreign_key :video_id

      String :role # eg "Musician", "Director", "Cinematographer", "Remixer"
    end

  	create_join_table(:album_id=>:albums, :video_id=>:videos)
  end

  down do
    drop_table :albums_artists
    drop_table :artists_videos
    drop_table :albums_videos
  end
end
