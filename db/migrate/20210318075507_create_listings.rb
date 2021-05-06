class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
      t.integer :user_id
      t.string :listing_name
      t.text :listing_description
      t.string :home_type
      t.string :room_type
      t.integer :bedroom_count
      t.integer :bathroom_count
      t.float :price
      t.integer :accomodate
      t.boolean :has_internet
      t.boolean :has_tv
      t.boolean :has_kitchen
      t.boolean :has_heating
      t.boolean :has_air_conditioning
      t.string :address
      t.boolean :is_active

      t.timestamps
    end
  end
end
