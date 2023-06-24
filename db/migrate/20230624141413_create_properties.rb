class CreateProperties < ActiveRecord::Migration[7.0]
  def change
    create_table :properties do |t|
      t.string :property_address
      t.string :properties_type
      t.integer :number_of_bedrooms
      t.integer :number_of_sitting_rooms
      t.integer :number_of_kitchen
      t.integer :number_of_bathrooms
      t.integer :number_of_toilets
      t.string :property_owner
      t.text :description
      t.datetime :valid_from
      t.datetime :valid_to

      t.timestamps
    end
  end
end
