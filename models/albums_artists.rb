# # This model is for our albums-artists join table.
# 
# By explicitly creating the join model, we're able to give it a `role` column.

class AlbumsArtists < Sequel::Model
end
