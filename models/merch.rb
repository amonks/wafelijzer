# # This is our merch model.

class Merch < Sequel::Model
  # First we want to set up our associations.
  # 
  # An artist can have multiple merches, and a merch can be for multiple artists
  many_to_many  :artists
end
