Sequel.migration do
  up do
    create_join_table(:artist_id=>:artists, :merch_id=>:merches)
  end

  down do
    drop_table :artists_merches
  end
end
