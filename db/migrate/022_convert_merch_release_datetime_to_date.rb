Sequel.migration do
  up do
    alter_table :merches do
      set_column_type :release_date, Date
    end
  end

  down do
  end
end
