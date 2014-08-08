Sequel.migration do
  up do
    create_table :videos do
		primary_key :id

		# utility
		DateTime	:created_at
		DateTime	:updated_at

		# basic info
		String	:title
		Date 	:release_date
		String	:service

		# vimeo
		String :vimeo_id

		# youtube
		String :youtube_id
    end
  end

  down do
    drop_table :videos
  end
end
