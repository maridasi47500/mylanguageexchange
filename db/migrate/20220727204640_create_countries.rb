class CreateCountries < ActiveRecord::Migration[6.0]
  def change
    create_table :countries do |t|
      t.string :name_fr
      t.string :name_en
      t.integer :no
      t.timestamps
    end
  end
end
