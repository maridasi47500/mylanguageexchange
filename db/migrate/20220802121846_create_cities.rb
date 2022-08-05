class CreateCities < ActiveRecord::Migration[6.0]
  def change
    create_table :cities do |t|
      t.integer :country_id
      t.string :name_fr
      t.string :name_en
      t.timestamps
    end
  end
end
