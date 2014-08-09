class Artist < Sequel::Model
	# set up associations
	many_to_many	:albums
	many_to_many	:videos
	many_to_many	:blogs

	many_to_many :members, :left_key=>:member_id, :right_key=>:group_id, :join_table=>:memberships, :class=>self
	many_to_many :groups, :right_key=>:member_id, :left_key=>:group_id, :join_table=>:memberships, :class=>self
end
