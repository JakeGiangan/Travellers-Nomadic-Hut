class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.integer :contact_number
      t.string :profile_photo

      t.timestamps
    end
  end
end
