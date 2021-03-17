class AddHouseRuleToProperty < ActiveRecord::Migration[5.2]
  def change
    add_column :properties, :no_smoking, :boolean
    add_column :properties, :pets_allowed, :boolean
    add_column :properties, :no_parties, :boolean
    add_column :properties, :other_rules, :boolean
    add_column :properties, :other_rules_description, :string
  end
end
