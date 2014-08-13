class Merch < Sequel::Model
	# set up associations
	many_to_many	:artists
end
