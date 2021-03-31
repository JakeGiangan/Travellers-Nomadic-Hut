class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.integer :listing_id
      t.integer :user_id
      t.date :check_in_date
      t.date :check_out_date
      t.float :total_price
      t.float :price

      t.timestamps
    end
  end
end
