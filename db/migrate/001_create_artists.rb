Sequel.migration do
  up do
    create_table :artists do
			primary_key :id		
			# utility
			DateTime	:created_at
			DateTime	:updated_at
			
			# basic info
			String	:name
			String	:slug		# urlsafe
			String	:real_name	# optional
			String	:soundcloud	# soundcloud url		
			String	:bio, :text => true		# stored as markdown		
			String	:image_url	# main artist image
	      
    end
  end

  down do
    drop_table :artists
  end
end
