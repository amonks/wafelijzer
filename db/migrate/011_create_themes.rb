Sequel.migration do
  up do
    create_table :themes do
      primary_key :id

      # utility
      DateTime  :created_at
      DateTime  :updated_at

      # content
      String :title
      String :css, :text => true
      String :js, :text => true
      
    end
  end

  down do
    drop_table :themes
  end
end
