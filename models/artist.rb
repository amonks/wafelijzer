# # This is our Artist model.

class Artist < Sequel::Model
  # First we want to set up our associations
  # 
  # An artist can have multiple albums, and an album can be by multiple artists
  many_to_many  :albums
  # An artist can have multiple videos, and a video can be by multiple artists
  many_to_many  :videos
  # An artist can have multiple blogs, and a blog can be about multiple artists
  many_to_many  :blogs

  # An artist can also have members, or be a member of other artists.
  # We'll use a join table, `memberships`, to assign artist memberships
  many_to_many :members, :left_key=>:member_id, :right_key=>:group_id, :join_table=>:memberships, :class=>self
  many_to_many :groups, :right_key=>:member_id, :left_key=>:group_id, :join_table=>:memberships, :class=>self
end
