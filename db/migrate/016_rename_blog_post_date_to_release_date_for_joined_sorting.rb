Sequel.migration do
  up do
    alter_table :blogs do
      rename_column :post_date, :release_date
    end
  end

  down do
  end
end
