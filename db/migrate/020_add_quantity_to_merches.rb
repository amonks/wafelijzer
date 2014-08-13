Sequel.migration do
  up do
    alter_table :merches do
    	add_column :quantity, Integer
    end
  end

  down do
  end
end
