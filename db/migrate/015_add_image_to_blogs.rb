Sequel.migration do
  up do
    alter_table :blogs do
    	add_column :image_url, String
    end
  end

  down do
  end
end
