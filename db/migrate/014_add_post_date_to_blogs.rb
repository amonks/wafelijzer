Sequel.migration do
  up do
    alter_table :blogs do
    	add_column :post_date, Date
    end
  end

  down do
  end
end
