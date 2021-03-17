class AddServiceToProperty < ActiveRecord::Migration[5.2]
  def change
    add_column :properties, :wifi, :boolean
    add_column :properties, :swimming_pool, :boolean
    add_column :properties, :parking, :boolean
    add_column :properties, :restaurant, :boolean
    add_column :properties, :twenty_four_hour_front_desk, :boolean
    add_column :properties, :fitness_center, :boolean
    add_column :properties, :airport_transfer, :boolean
    add_column :properties, :pay_upon_checkin, :boolean
    add_column :properties, :family_friendly, :boolean
    add_column :properties, :near_mrt_station, :boolean
    add_column :properties, :no_cancellation_fee, :boolean
    add_column :properties, :cancellation_fee, :boolean
    add_column :properties, :cancellation_fee_price, :integer
  end
end
