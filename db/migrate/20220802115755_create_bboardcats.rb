class CreateBboardcats < ActiveRecord::Migration[6.0]
  def change
    create_table :bboardcats do |t|
      t.string :name_fr
      t.string :name_en
      t.string :description_fr
      t.string :description_en
      t.timestamps
    end
  end
end
