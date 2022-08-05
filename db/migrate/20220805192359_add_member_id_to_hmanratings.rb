class AddMemberIdToHmanratings < ActiveRecord::Migration[6.0]
  def change
    add_column :hmanratings, :member_id, :integer
  end
end
