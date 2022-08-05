class CreateHangmantypes < ActiveRecord::Migration[6.0]
  def change
    create_table :hangmantypes do |t|
      t.string :name_fr
      t.string :name_en
      t.timestamps
    end
    create_table :hangmancats do |t|
      t.string :name_fr
      t.string :name_en
      t.timestamps
    end
  end
end
