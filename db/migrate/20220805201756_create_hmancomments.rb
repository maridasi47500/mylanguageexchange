class CreateHmancomments < ActiveRecord::Migration[6.0]
  def change
    create_table :hmancomments do |t|
      t.text :txaCmts
      t.integer :MId
      t.integer :member_id
    end
  end
end
