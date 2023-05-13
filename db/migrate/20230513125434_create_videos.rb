class CreateVideos < ActiveRecord::Migration[6.0]
  def change
    create_table :videos do |t|
      t.string :filename
      t.integer :hangman_id
    end
  end
end
