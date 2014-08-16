# # This is our Blog model.

class Blog < Sequel::Model
	# First we want to set up our associations

    # An artist can have multiple blogs, and a blog can be by about multiple artists
	many_to_many	:artists
end
