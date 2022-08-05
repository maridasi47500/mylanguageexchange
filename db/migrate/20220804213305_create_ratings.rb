class CreateRatings < ActiveRecord::Migration[6.0]
  def change
    create_table :hmanratings do |t|
      t.string "txtGuess"
      t.integer "selX3"
      t.integer "radRating"
      t.text "txaFBKComments"
      t.integer :GId
      t.timestamps
    end
  end
end
