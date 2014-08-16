Sequel.migration do
  up do
    create_table :blogs do
      primary_key  :id

      # utility
      DateTime  :created_at
      DateTime  :updated_at

      # content
      String  :title
      String  :body,   :text => true
    end
  end

  down do
    drop_table :blogs
  end
end
