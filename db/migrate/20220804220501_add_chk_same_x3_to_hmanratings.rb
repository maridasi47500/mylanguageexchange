class AddChkSameX3ToHmanratings < ActiveRecord::Migration[6.0]
  def change
    add_column :hmanratings, :chkSameX3, :boolean
  end
end
