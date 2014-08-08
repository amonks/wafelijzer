Sequel.migration do
  up do
    create_table :texts do
      primary_key :id

			# utility
			DateTime	:created_at
			DateTime	:updated_at

			# content
      String :title
      String :body, :text => true # markdown formatted

    end
  end

  down do
    drop_table :texts
  end
end
