class Video < Sequel::Model
	# set up associations
	many_to_many	:artists
	many_to_many	:albums
end
