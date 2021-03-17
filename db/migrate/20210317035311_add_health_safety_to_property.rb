class AddHealthSafetyToProperty < ActiveRecord::Migration[5.2]
  def change
    add_column :properties, :smoke_alarm, :boolean
    add_column :properties, :security_guards, :boolean
    add_column :properties, :cctvs_equipped, :boolean
    add_column :properties, :near_hospitals, :boolean
    add_column :properties, :safety_deposit_box, :boolean
    add_column :properties, :smoking_area, :boolean
    add_column :properties, :twenty_four_hour_security, :boolean
    add_column :properties, :elevator, :boolean
    add_column :properties, :disabled_access_friendly, :boolean
  end
end
