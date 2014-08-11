Sequel.migration do
  up do
    alter_table :videos do
    	add_column :type, String
    end
  end

  down do
  end
end
