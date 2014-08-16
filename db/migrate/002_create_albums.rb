Sequel.migration do
  up do
    create_table :albums do
      primary_key :id

      # utility
      DateTime  :created_at
      DateTime  :updated_at

      # basic info
      String  :title
      DateTime   :release_date
      String :cover_url
      String :label  # eg 'Belgian Man Records'
      String :type  # eg 'compilation'
      String :about, :text => true
      String :credits, :text => true

      # bandcamp
      String :bandcamp_url  # eg 'http://music.belgianman.com/album/bedroom-classics-vol-1'
      String :bandcamp_id
    end
  end

  down do
    drop_table :albums
  end
end
