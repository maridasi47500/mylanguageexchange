class CreateNotepads < ActiveRecord::Migration[6.0]
  def change
    create_table :notepads do |t|
      t.integer :lang1
      t.integer :lang2
      t.string :txtF1
      t.string :txtF2
      t.text :txtF3
    end
  end
end
