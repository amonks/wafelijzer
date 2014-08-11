Sequel.migration do
  up do
    alter_table :blogs do
    	add_column :type, String
    end
  end

  down do
  end
end
