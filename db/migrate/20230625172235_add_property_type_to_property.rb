class AddPropertyTypeToProperty < ActiveRecord::Migration[7.0]
  def change
    add_column :properties, :property_type, :integer, default: 0
  end
end
