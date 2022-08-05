class CreateBboards < ActiveRecord::Migration[6.0]
  def change
    create_table :bboards do |t|
      t.integer :selX3
      t.integer :selX6
      t.integer :selCat
      t.string :txtF1
      t.text :txaF2
      t.timestamps
    end
    create_table :emails do |t|
      t.string :txtSubj
      t.text :txaBody
      t.boolean :chkCopySender
      t.integer :expediteur_id
      t.integer :UId
      t.string  :lang
      t.timestamps
    end
  end
end
