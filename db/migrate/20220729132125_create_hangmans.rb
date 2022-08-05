class CreateHangmans < ActiveRecord::Migration[6.0]
  def change
    create_table :hangmen do |t|
      t.string :title
      t.string :guess
      t.string :language
      t.string :types
      t.string :category
      t.string :hide
      t.string :hint1
      t.string :hint2
      t.string :hint3
			t.string :equiv1
			t.string :equiv2
			t.string :equiv3
			t.text :desc
      t.string :winmsg
      t.string :losemsg
      t.timestamps
    end
  end
end
