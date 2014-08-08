class Artist < Sequel::Model
	# set up associations
	many_to_many	:albums
	many_to_many	:videos
	many_to_many	:blogs
end
