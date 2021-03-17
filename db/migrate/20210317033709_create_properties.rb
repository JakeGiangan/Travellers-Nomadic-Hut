class CreateProperties < ActiveRecord::Migration[5.2]
  def change
    create_table :properties do |t|
      t.integer :host_id
      t.string :property_name
      t.integer :property_type
      t.integer :check_in_time
      t.integer :check_out_time
      t.text :property_description
      t.integer :rates
      t.integer :service_fee
      t.integer :cleaning_fee
      t.integer :capacity
      t.integer :location

      t.timestamps
    end
  end
end
