Sequel.migration do
  up do
    create_table :memberships do
      primary_key :id

      foreign_key :group_id
      foreign_key :member_id
      
    end
  end

  down do
    drop_table :memberships
  end
end
