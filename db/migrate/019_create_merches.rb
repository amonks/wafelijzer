Sequel.migration do
  up do
    create_table :merches do
      primary_key :id

      # utility
      DateTime  :created_at
      DateTime  :updated_at

      # basic info
      String  :title
      String :slug
      DateTime   :release_date
      String :image_url
      String :type  # eg 't-shirt'
      String :about, :text => true
      Integer :price_in_cents
    end
  end

  down do
    drop_table :merches
  end
end
