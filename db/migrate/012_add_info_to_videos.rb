Sequel.migration do
  up do
    alter_table :videos do
    	add_column :about, String, :text => true
    end
  end

  down do
  end
end
