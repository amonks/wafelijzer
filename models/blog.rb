class Blog < Sequel::Model
	# set up associations
	many_to_many	:albums
	many_to_many	:artists
end
